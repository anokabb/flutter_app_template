#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Modular Deployment Script
# ---------------------------------------------------------------------------
# This script is a thin orchestrator that wires together a set of reusable
# helper scripts located in `deployment/scripts/`.  Copy the entire deployment
# folder to a different Flutter project, adjust `deploy.env`, and you are ready
# to ship 🚀.
# ---------------------------------------------------------------------------
set -euo pipefail

VERSION="2.0.0"

# ----------------------------------------
# Directory plumbing
# ----------------------------------------
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
export PROJECT_ROOT

HELPER_DIR="$SCRIPT_DIR/scripts"
LOG_FILE="$SCRIPT_DIR/deploy.log"
export LOG_FILE

# Sensitive files to remove on exit
EXTRA_CLEANUP_FUN='if [[ -f "$PROJECT_ROOT/android/playstore.json" ]]; then secure_delete "$PROJECT_ROOT/android/playstore.json"; fi; if [[ -f "$PROJECT_ROOT/ios/AppStoreConnect.p8" ]]; then secure_delete "$PROJECT_ROOT/ios/AppStoreConnect.p8"; fi'

# ----------------------------------------
# Source helper libraries
# ----------------------------------------
# shellcheck source=deployment/scripts/common.sh
source "$HELPER_DIR/common.sh"
# shellcheck source=deployment/scripts/env_check.sh
source "$HELPER_DIR/env_check.sh"
# shellcheck source=deployment/scripts/keystore.sh
source "$HELPER_DIR/keystore.sh"
# shellcheck source=deployment/scripts/versioning.sh
source "$HELPER_DIR/versioning.sh"
# shellcheck source=deployment/scripts/deploy_platform.sh
source "$HELPER_DIR/deploy_platform.sh"

# Trap unhandled errors so we always cleanup
trap 'trap_error $LINENO' ERR
trap cleanup EXIT INT TERM

# ----------------------------------------
# CLI Argument parsing
# ----------------------------------------
PLATFORM=""
BUILD_NUMBER=""
DEBUG=${DEBUG:-false}

usage() {
  echo "Usage: $0 -p <platform(s)> [-n <build_number>]" >&2
  echo "  -p: Platform(s) to deploy. Options:" >&2
  echo "      - Single: android, huawei, ios" >&2
  echo "      - Multiple: android,ios or android,huawei,ios" >&2
  echo "      - All: all" >&2
  echo "  -n: Build number (optional - if not provided, current build number will be incremented)" >&2
  echo "" >&2
  echo "Note: Huawei platform can be disabled by setting HUAWEI_ENABLED=false in deploy.env" >&2
  exit 1
}

while getopts "p:n:" opt; do
  case $opt in
    p) PLATFORM="$OPTARG" ;;
    n) BUILD_NUMBER="$OPTARG" ;;
    *) usage ;;
  esac
done

[[ -z "$PLATFORM" ]] && usage

# Validate platform(s) - allow single platforms, comma-separated, or "all"
if [[ "$PLATFORM" != "all" ]]; then
  # Split and validate each platform
  IFS=',' read -ra TEMP_PLATFORMS <<< "$PLATFORM"
  for platform in "${TEMP_PLATFORMS[@]}"; do
    platform=$(echo "$platform" | xargs)  # Trim whitespace
    if [[ ! "$platform" =~ ^(android|huawei|ios)$ ]]; then
      echo "Error: Invalid platform '$platform'. Valid options: android, huawei, ios, all" >&2
      usage
    fi
  done
fi

# If build number is provided, validate it; otherwise we'll increment current
if [[ -n "$BUILD_NUMBER" ]]; then
[[ ! "$BUILD_NUMBER" =~ ^[0-9]+$ ]] && usage
fi

# ----------------------------------------
# Git branch validation
# ----------------------------------------
BRANCH=$(git -C "$PROJECT_ROOT" rev-parse --abbrev-ref HEAD)
if [[ "$DEBUG" != "true" ]]; then
  if [[ ! "$BRANCH" =~ ^(master|test_app)$ ]]; then
    log ERROR "Unsupported branch '$BRANCH' – must be master or test_app"
    exit 1
  fi
fi

# Check if working directory is clean and up-to-date (skip in DEBUG mode)
if [[ "$DEBUG" != "true" ]]; then
  log INFO "Checking git status for clean working directory..."
  STATUS=$(git -C "$PROJECT_ROOT" status)
  if [[ $STATUS == *"Your branch is up to date with"* && $STATUS == *"nothing to commit, working tree clean"* ]]; then
    log INFO "✅ Branch is up-to-date and working directory is clean"
  else
    log ERROR "❌ Branch is not up-to-date or there are uncommitted changes. Please push/pull and commit all changes first."
    log ERROR "Use DEBUG=true to skip this check during development"
    exit 1
  fi
else
  log INFO "🔧 DEBUG mode: Skipping git status checks"
fi

log INFO "Deployment script v$VERSION started (branch=$BRANCH)"

# ----------------------------------------
# Load env file
# ----------------------------------------
if [[ -f "$SCRIPT_DIR/deploy.env" ]]; then
  # shellcheck disable=SC1090
  source "$SCRIPT_DIR/deploy.env"
else
  log ERROR "deploy.env missing – copy deploy.env.example and configure the values"
  exit 1
fi

# Default app naming – can be overridden in deploy.env
if [[ "$BRANCH" == "master" ]]; then
  APP_PREFIX="${APP_PREFIX:-MyApp}"
  PACKAGE_NAME="${PACKAGE_NAME:-com.example.myapp}"
else
  APP_PREFIX="${APP_PREFIX:-MyApp-Test}"
  PACKAGE_NAME="${PACKAGE_NAME:-com.example.myapp.test}"
fi

# Export additional variables that Fastlane might need
export PACKAGE_NAME
export BUILD_NUMBER
export BRANCH
export GOOGLE_PLAY_TRACK="${GOOGLE_PLAY_TRACK:-internal}"
export APP_STORE_CONNECT_KEY_ID
export APP_STORE_CONNECT_ISSUER_ID
export IOS_APP_IDENTIFIER
export IOS_APPLE_ID
export IOS_TEAM_ID
export IOS_ITC_TEAM_ID
export HUAWEI_APP_ID
export HUAWEI_CLIENT_ID
export HUAWEI_CLIENT_SECRET
export HUAWEI_ENABLED="${HUAWEI_ENABLED:-true}"
export BROWSERSTACK_ENABLED="${BROWSERSTACK_ENABLED:-true}"
export SLACK_NOTIFICATIONS_ENABLED="${SLACK_NOTIFICATIONS_ENABLED:-true}"

# Function to filter platforms based on enabled features
filter_platforms() {
  local input_platforms="$1"
  local filtered_platforms=()
  
  if [[ "$input_platforms" == "all" ]]; then
    filtered_platforms+=("android" "ios")
    if [[ "$HUAWEI_ENABLED" == "true" ]]; then
      filtered_platforms+=("huawei")
    else
      log INFO "🚫 Huawei support is disabled (HUAWEI_ENABLED=false)"
    fi
  else
    # Split and filter platforms
    IFS=',' read -ra TEMP_PLATFORMS <<< "$input_platforms"
    for platform in "${TEMP_PLATFORMS[@]}"; do
      platform=$(echo "$platform" | xargs)  # Trim whitespace
      if [[ "$platform" == "huawei" && "$HUAWEI_ENABLED" != "true" ]]; then
        log WARN "🚫 Skipping Huawei platform - Huawei support is disabled (HUAWEI_ENABLED=false)"
        continue
      fi
      filtered_platforms+=("$platform")
    done
  fi
  
  # Return filtered platforms as comma-separated string
  local IFS=','
  echo "${filtered_platforms[*]}"
}

# ----------------------------------------
# Pre-flight checks & setup
# ----------------------------------------
check_requirements

# Filter platforms based on enabled features
FILTERED_PLATFORMS=$(filter_platforms "$PLATFORM")

# Check if we have any platforms left after filtering
if [[ -z "$FILTERED_PLATFORMS" ]]; then
  log ERROR "No platforms available for deployment after filtering"
  exit 1
fi

log INFO "Platforms to deploy: $FILTERED_PLATFORMS"

# Check environment variables for each platform that will be deployed
IFS=',' read -ra PLATFORMS_TO_CHECK <<< "$FILTERED_PLATFORMS"
for platform in "${PLATFORMS_TO_CHECK[@]}"; do
  platform=$(echo "$platform" | xargs)  # Trim whitespace
  check_env_vars "$platform"
done

setup_keystore "$BRANCH"

# Determine build number: use provided value or increment current
if [[ -z "$BUILD_NUMBER" ]]; then
  log INFO "No build number provided, incrementing current build number"
  CURRENT_BUILD_NUMBER=$(get_current_build_number)
  BUILD_NUMBER=$((CURRENT_BUILD_NUMBER + 1))
  log INFO "Using incremented build number: $BUILD_NUMBER"
else
  log INFO "Using provided build number: $BUILD_NUMBER"
fi

update_pubspec_version "$BUILD_NUMBER"

# ----------------------------------------
# Deploy 🎉
# ----------------------------------------
# Deploy to filtered platforms
IFS=',' read -ra PLATFORMS <<< "$FILTERED_PLATFORMS"
for platform in "${PLATFORMS[@]}"; do
  # Trim whitespace from platform
  platform=$(echo "$platform" | xargs)
  if [[ "$platform" =~ ^(android|huawei|ios)$ ]]; then
    deploy_platform "$platform" &  # Run in background
  else
    log ERROR "Invalid platform: $platform"
    # It's tricky to exit here cleanly if other jobs are running.
    # For now, we log the error and let other valid platforms proceed.
    # A more robust solution might involve killing other background jobs.
  fi
done

# Wait for all background deployment jobs to complete
wait

log INFO "Deployment completed successfully ✅" 