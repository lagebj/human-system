#!/usr/bin/env bash
set -Eeuo pipefail

workspace="${CODESPACE_VSCODE_FOLDER:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
cd "$workspace"

# Make .env values available to the rest of this script (skill sync, gh checks).
export HUMAN_SYSTEM_WORKSPACE="$workspace"
# shellcheck source=load-dotenv.sh
. .devcontainer/load-dotenv.sh

# Wire .env auto-loading into every future shell in this container. Idempotent:
# the marker guards against duplicate blocks on rebuilds.
install_dotenv_hook() {
  local marker="# >>> human-system dotenv auto-load >>>"
  local loader="$workspace/.devcontainer/load-dotenv.sh"
  local block
  block="$(printf '%s\n[ -f "%s" ] && . "%s"\n# <<< human-system dotenv auto-load <<<\n' \
    "$marker" "$loader" "$loader")"

  local target
  for target in "$HOME/.bashrc" "$HOME/.profile"; do
    [[ -e "$target" ]] || : > "$target"
    if ! grep -qF "$marker" "$target" 2>/dev/null; then
      printf '\n%s\n' "$block" >> "$target"
      echo "[devcontainer] Added .env auto-load hook to $target"
    fi
  done

  # Login shells and non-interactive `bash -l` (e.g. some exec sessions).
  local profiled="/etc/profile.d/99-human-system-dotenv.sh"
  if [[ ! -f "$profiled" ]] || ! grep -qF "$marker" "$profiled" 2>/dev/null; then
    printf '%s\n[ -f "%s" ] && . "%s"\n' "$marker" "$loader" "$loader" \
      | sudo tee "$profiled" >/dev/null
    sudo chmod 0644 "$profiled"
    echo "[devcontainer] Installed $profiled"
  fi
}

install_dotenv_hook

bash .devcontainer/fix-volume-permissions.sh

echo "[devcontainer] Synchronising OpenCode agent skills..."
bash .devcontainer/sync-agent-skills.sh --required

echo
echo "Environment ready."
printf 'Node: %s\n' "$(node --version)"
printf 'npm: %s\n' "$(npm --version)"
printf 'git: %s\n' "$(git --version)"
printf 'gh: %s\n' "$(gh --version 2>/dev/null | head -1 || echo 'not found')"
printf 'jq: %s\n' "$(jq --version)"
printf 'rg: %s\n' "$(rg --version | head -1)"
printf 'OpenCode: %s\n' "$(opencode --version)"

if command -v claude >/dev/null 2>&1; then
  printf 'Claude Code: %s\n' "$(claude --version 2>/dev/null || echo 'installed')"
else
  echo "Claude Code: not found in PATH (devcontainer feature may not have completed yet)"
fi

skills_file="${XDG_DATA_HOME:-$HOME/.local/share}/human-system-agent-skills/managed-skills.txt"
if [[ -f "$skills_file" ]]; then
  printf 'Agent skills: %s\n' "$(wc -l < "$skills_file" | tr -d '[:space:]')"
fi

echo
echo "Local devcontainer:"
echo "  Start OpenCode:     opencode"
echo "  Start Claude Code:  claude"
echo "  Validate:           bash .devcontainer/validate.sh"

if [[ "${CODESPACES:-false}" == "true" ]]; then
  echo
  echo "Codespaces:"
  echo "  OLLAMA_API_KEY must be configured as a Codespaces secret."
  echo "  OpenCode Web starts automatically through post-start.sh."
  printf '  OpenCode log: %s\n' \
    "${XDG_STATE_HOME:-$HOME/.local/state}/human-system/opencode-web.log"
fi