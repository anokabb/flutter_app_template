#!/usr/bin/env bash

source "$(dirname "${BASH_SOURCE[0]}")/common.sh"

# show_mac_notification <app_name> <platform> <session_url>
show_mac_notification() {
  local app_name="$1"
  local platform="$2"
  local session_url="$3"

  # Only macOS supports terminal-notifier
  if [[ "$OSTYPE" != "darwin"* ]]; then
    return 0
  fi

  if ! command -v terminal-notifier >/dev/null 2>&1; then
    log WARN "'terminal-notifier' not found. Install via: brew install terminal-notifier"
    return 0
  fi

  terminal-notifier \
      -title "🚀 $app_name" \
      -message "✅ Deployed to $platform" \
      -open "$session_url" \
      -sound default \
      -activate "com.apple.Terminal" \
      -ignoreDnD
}

return 0 