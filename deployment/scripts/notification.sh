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

  local notifier_args=()
  notifier_args+=(-title "🚀 $app_name")
  notifier_args+=(-message "✅ Deployed to $platform")
  if [[ -n "$session_url" ]]; then
    notifier_args+=(-open "$session_url")
  fi
  notifier_args+=(-sound default)
  notifier_args+=(-activate "com.apple.Terminal")
  notifier_args+=(-ignoreDnD)

  terminal-notifier "${notifier_args[@]}"
}

return 0 