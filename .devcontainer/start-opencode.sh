#!/usr/bin/env bash
set -Eeuo pipefail

workspace="${CODESPACE_VSCODE_FOLDER:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
cd "$workspace"

if [[ -z "${OLLAMA_API_KEY:-}" ]]; then
  cat <<'MESSAGE'
OpenCode Web requires OLLAMA_API_KEY to be set.

For local devcontainers, set the environment variable before running this script.
For Codespaces, add OLLAMA_API_KEY as a GitHub Codespaces secret.

Example:
  export OLLAMA_API_KEY="your-api-key"
  bash .devcontainer/start-opencode.sh
MESSAGE
  exit 1
fi

echo "Starting OpenCode Web"
echo "Workspace: $workspace"
echo "Model: qwen3.5:27b (local Ollama)"

headless_bin="${XDG_RUNTIME_DIR:-/tmp}/human-system-headless-bin"
mkdir -p "$headless_bin"

cat > "$headless_bin/xdg-open" <<'EOF'
#!/usr/bin/env bash
echo "Browser launch suppressed in headless environment: $*" >&2
exit 0
EOF

chmod +x "$headless_bin/xdg-open"
export PATH="$headless_bin:$PATH"

exec opencode web \
  --hostname 0.0.0.0 \
  --port 4096