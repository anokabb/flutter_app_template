#!/usr/bin/env bash

# This script provides a single function `deploy_platform` which encapsulates all
# the steps required to produce a release for a given platform and upload it to
# BrowserStack / App Stores.  It relies on helper functions sourced from other
# scripts in the same directory.

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"
source "$(dirname "${BASH_SOURCE[0]}")/browserstack.sh"
source "$(dirname "${BASH_SOURCE[0]}")/slack.sh"
source "$(dirname "${BASH_SOURCE[0]}")/notification.sh"

# deploy_platform <platform>
deploy_platform() {
  local platform="$1"  # android | huawei | ios

  local platform_capitalised="$(echo ${platform:0:1} | tr '[:lower:]' '[:upper:]')${platform:1}"
  APP_NAME="${APP_PREFIX}-${platform_capitalised}-${BUILD_NUMBER}"
  export APP_NAME

  log INFO "Starting deployment for $platform (branch=$BRANCH, build=$BUILD_NUMBER)"

  cd "$PROJECT_ROOT"


  # ------------------------------------------------------
  # Build
  # ------------------------------------------------------
  if [[ "$platform" == "ios" ]]; then
    # iOS build
    pushd ios >/dev/null || exit 1
      pod deintegrate || true
      [[ -f Podfile.lock ]] && rm Podfile.lock
      pod install --repo-update
    popd >/dev/null

    fvm flutter build ipa --release --build-number="$BUILD_NUMBER" --export-method=app-store

    pushd ios >/dev/null || exit 1
      bundle install

      # Create key file for Fastlane
      echo "$APP_STORE_CONNECT_KEY_CONTENT" | base64 --decode > AppStoreConnect.p8
      chmod 600 AppStoreConnect.p8

      # Find and export IPA path (from ios/ directory, so ../build is correct)
      local ipa_src
      ipa_src=$(find ../build/ios/ipa -maxdepth 1 -name "*.ipa" | head -n1 || true)
      if [[ -n "$ipa_src" ]]; then
        # Convert relative path to absolute path
        export IPA_PATH="$(cd "$(dirname "$ipa_src")" && pwd)/$(basename "$ipa_src")"
        log INFO "Setting IPA_PATH to: $IPA_PATH"
      else
        log ERROR "No .ipa file found in ../build/ios/ipa/"
        return 1
      fi
      
      bundle exec fastlane ios deploy
      secure_delete AppStoreConnect.p8
    popd >/dev/null

    # Result path
    NEW_APP_PATH="deployment/releases/${APP_NAME}.ipa"
    mkdir -p deployment/releases
    # Copy the first IPA found in the output directory
    local ipa_src
    ipa_src=$(find build/ios/ipa -maxdepth 1 -name "*.ipa" | head -n1 || true)
    if [[ -n "$ipa_src" ]]; then
      cp "$ipa_src" "$NEW_APP_PATH"
    else
      log ERROR "No .ipa file produced by Flutter build"
      return 1
    fi
  else
    # Android / Huawei build (AAB)
    local flutter_build_command="fvm flutter build appbundle --build-number=$BUILD_NUMBER --dart-define=ENV=production"
    if [[ "${FLAVOR_ENABLED:-false}" == "true" ]]; then
        if [[ "$platform" != "android" && "$platform" != "huawei" ]]; then
            log INFO "FLAVOR_ENABLED is true. Using platform '$platform' as flavor."
            flutter_build_command="$flutter_build_command --flavor $platform"
        else
            log INFO "FLAVOR_ENABLED is true, but platform is '$platform' (a base platform). Building without a specific --flavor argument for this base platform."
            # No --flavor option added for base platforms like android/huawei even if FLAVOR_ENABLED is true
        fi
    else
        log INFO "FLAVOR_ENABLED is false (or not set). Building without --flavor."
        # No --flavor option added
    fi

    $flutter_build_command

    # Find the AAB file first to ensure it exists before Fastlane deployment
    local aab_src
    local aab_search_path

    if [[ "${FLAVOR_ENABLED:-false}" == "true" ]]; then
        if [[ "$platform" != "android" && "$platform" != "huawei" ]]; then
            # FLAVOR_ENABLED is true, and platform was used as flavor (e.g., "staging")
            aab_search_path="build/app/outputs/bundle/${platform}Release"
            log INFO "FLAVOR_ENABLED is true. Platform '$platform' was used as flavor. Searching AAB in: $aab_search_path"
        else
            # FLAVOR_ENABLED is true, but platform is "android" or "huawei".
            # Build command did not add --flavor, so output is in standard 'release' directory.
            aab_search_path="build/app/outputs/bundle/release"
            log INFO "FLAVOR_ENABLED is true, platform is '$platform' (base platform, no explicit flavor used in build). Searching AAB in: $aab_search_path"
        fi
    else
      aab_search_path="build/app/outputs/bundle/release"
      log INFO "FLAVOR_ENABLED is fase, platform is '$platform' (base platform, no explicit flavor used in build). Searching AAB in: $aab_search_path"
    fi

    aab_src=$(find "$aab_search_path" -maxdepth 1 -name "*.aab" | head -n1 || true)

    if [[ -z "$aab_src" ]]; then
      log ERROR "No .aab file found in '$aab_search_path'. Please check Flutter build logs, platform, and FLAVOR_ENABLED setting."
      return 1
    fi

    log INFO "Found AAB file: $aab_src"

    pushd android >/dev/null || exit 1
      bundle install
      if [[ "$platform" == "android" ]]; then
        echo "$PLAYSTORE_KEY" | base64 --decode > playstore.json
        # Export the absolute AAB path for Fastlane to use
        export AAB_PATH="$PROJECT_ROOT/$aab_src"
        log INFO "Setting AAB_PATH to: $AAB_PATH"
        bundle exec fastlane deploy_google_play
        secure_delete playstore.json
      else
        export HUAWEI_CLIENT_ID HUAWEI_CLIENT_SECRET HUAWEI_APP_ID
        # Export the absolute AAB path for Fastlane to use
        export AAB_PATH="$PROJECT_ROOT/$aab_src"
        log INFO "Setting AAB_PATH to: $AAB_PATH"
        bundle exec fastlane deploy_huawei_appgallery
      fi
    popd >/dev/null

    # Copy artifact to releases directory
    NEW_APP_PATH="deployment/releases/${APP_NAME}.aab"
    mkdir -p deployment/releases
    cp "$aab_src" "$NEW_APP_PATH"
  fi

  # ------------------------------------------------------
  # Upload + Notifications
  # ------------------------------------------------------
  if [[ "${BROWSERSTACK_ENABLED:-true}" == "true" ]]; then
    upload_to_browserstack "$platform" "$NEW_APP_PATH" || return 1 # Allow failure here if not critical
  else
    log INFO "🚫 BrowserStack upload skipped (BROWSERSTACK_ENABLED=false)"
  fi

  if [[ "${SLACK_NOTIFICATIONS_ENABLED:-true}" == "true" ]]; then
    post_slack_message "$MESSAGE_TEXT" || return 1 # Allow failure here if not critical
  else
    log INFO "🚫 Slack notification skipped (SLACK_NOTIFICATIONS_ENABLED=false)"
    # Print message to console if Slack is disabled but we are not in DEBUG mode
    if [[ "${DEBUG:-false}" != "true" ]]; then
        log INFO "Message that would be sent to Slack:"
        echo -e "$MESSAGE_TEXT"
    fi
  fi

  show_mac_notification "$APP_NAME" "$platform" "$SESSION_URL"
}

return 0 