#!/usr/bin/env bash
set -Eeuo pipefail

readonly uid="$(id -u)"
readonly gid="$(id -g)"

log() {
  printf '[volume-permissions] %s\n' "$*"
}

for dir in \
  "$HOME/.claude" \
  "$HOME/.config/opencode"
do
  if [[ ! -d "$dir" ]]; then
    log "Skipping missing directory: $dir"
    continue
  fi

  current_owner="$(stat -c '%u:%g' "$dir" 2>/dev/null || stat -f '%u:%g' "$dir" 2>/dev/null || echo 'unknown')"

  if [[ "$current_owner" == "$uid:$gid" ]]; then
    log "Already owned by $uid:$gid: $dir"
    continue
  fi

  log "Fixing ownership of $dir (was $current_owner, setting to $uid:$gid)"
  sudo chown -R "$uid:$gid" "$dir"
done

log "Volume permissions repair complete."