#!/usr/bin/env bash
set -Eeuo pipefail

workspace="${CODESPACE_VSCODE_FOLDER:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
cd "$workspace"

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