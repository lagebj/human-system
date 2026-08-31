#!/usr/bin/env bash
set -Eeuo pipefail

workspace="${CODESPACE_VSCODE_FOLDER:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
cd "$workspace"

errors=0

printf '=== Agent Parity Validation ===\n\n'

# 1. AGENTS.md exists
if [[ -f AGENTS.md ]]; then
  printf '[OK] AGENTS.md exists at repository root\n'
else
  printf '[FAIL] AGENTS.md not found at repository root\n' >&2
  errors=$((errors + 1))
fi

# 2. CLAUDE.md exists and imports AGENTS.md
if [[ -f CLAUDE.md ]]; then
  printf '[OK] CLAUDE.md exists at repository root\n'
  if grep -q '@AGENTS.md' CLAUDE.md; then
    printf '[OK] CLAUDE.md imports AGENTS.md (single source of truth)\n'
  else
    printf '[WARN] CLAUDE.md does not contain @AGENTS.md import — instructions may diverge\n' >&2
  fi
else
  printf '[FAIL] CLAUDE.md not found at repository root\n' >&2
  errors=$((errors + 1))
fi

# 3. Claude managed settings enforce Claude.ai login
managed_settings=".devcontainer/managed-settings.json"
if [[ -f "$managed_settings" ]]; then
  printf '[OK] %s exists\n' "$managed_settings"
  if jq -e '.forceLoginMethod == "claudeai"' "$managed_settings" >/dev/null 2>&1; then
    printf '[OK] forceLoginMethod is "claudeai"\n'
  else
    printf '[FAIL] forceLoginMethod is not set to "claudeai" in managed settings\n' >&2
    errors=$((errors + 1))
  fi

  if jq -e '.env.ANTHROPIC_API_KEY // empty | . == ""' "$managed_settings" >/dev/null 2>&1; then
    printf '[OK] ANTHROPIC_API_KEY is explicitly cleared in managed settings\n'
  else
    printf '[FAIL] ANTHROPIC_API_KEY is not explicitly cleared in managed settings\n' >&2
    errors=$((errors + 1))
  fi
else
  printf '[FAIL] %s not found\n' "$managed_settings" >&2
  errors=$((errors + 1))
fi

# 4. Repo-local skill is discoverable by both agents
data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
opencode_skills="$config_home/opencode/skills"
claude_skills="$workspace/.claude/skills"
manifest="$data_home/human-system-agent-skills/managed-skills.txt"
repo_local_skill="$workspace/.agents/skills/human-systems-context"

if [[ -d "$repo_local_skill" && -f "$repo_local_skill/SKILL.md" ]]; then
  printf '[OK] Repo-local skill human-systems-context exists\n'
else
  printf '[FAIL] Repo-local skill human-systems-context not found\n' >&2
  errors=$((errors + 1))
fi

# 5. Skill parity between OpenCode and Claude
if [[ -f "$manifest" ]]; then
  opencode_count=0
  claude_count=0
  missing_in_claude=0

  while IFS= read -r skill_name; do
    [[ -n "$skill_name" ]] || continue

    if [[ -e "$opencode_skills/$skill_name" ]]; then
      opencode_count=$((opencode_count + 1))
    fi

    if [[ -e "$claude_skills/$skill_name" ]]; then
      claude_count=$((claude_count + 1))
    else
      printf '[FAIL] Skill "%s" present for OpenCode but missing for Claude\n' "$skill_name" >&2
      missing_in_claude=$((missing_in_claude + 1))
    fi
  done < "$manifest"

  printf '[OK] OpenCode discovers %d managed skills\n' "$opencode_count"
  printf '[OK] Claude discovers %d managed skills\n' "$claude_count"

  if [[ "$missing_in_claude" -gt 0 ]]; then
    errors=$((errors + missing_in_claude))
  else
    printf '[OK] Skill parity: all managed skills discoverable by both agents\n'
  fi
else
  printf '[WARN] Managed skills manifest not found at %s\n' "$manifest"
  printf '       Run bash .devcontainer/sync-agent-skills.sh --required to install skills\n'
fi

# 6. Repo-local skill is linked for both agents
local_skill_linked_opencode=false
local_skill_linked_claude=false

if [[ -L "$opencode_skills/human-systems-context" ]]; then
  local_skill_linked_opencode=true
fi
if [[ -L "$claude_skills/human-systems-context" ]]; then
  local_skill_linked_claude=true
fi

if [[ "$local_skill_linked_opencode" == true ]]; then
  printf '[OK] Repo-local human-systems-context skill linked for OpenCode\n'
else
  printf '[WARN] Repo-local human-systems-context skill not yet linked for OpenCode (run sync-agent-skills.sh)\n'
fi

if [[ "$local_skill_linked_claude" == true ]]; then
  printf '[OK] Repo-local human-systems-context skill linked for Claude Code\n'
else
  printf '[WARN] Repo-local human-systems-context skill not yet linked for Claude Code (run sync-agent-skills.sh)\n'
fi

# 7. Mutable state isolation checks
claude_config="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
if [[ "$claude_config" == "$HOME/.claude" ]]; then
  printf '[OK] Claude config directory: %s (isolated volume mount)\n' "$claude_config"
else
  printf '[OK] Claude config directory: %s\n' "$claude_config"
fi

opencode_config="$config_home/opencode"
if [[ -d "$opencode_config" ]]; then
  printf '[OK] OpenCode config directory: %s\n' "$opencode_config"
else
  printf '[INFO] OpenCode config directory not yet created: %s (created on first run)\n' "$opencode_config"
fi

printf '\n=== Agent Parity Validation Complete ===\n'
if [[ "$errors" -eq 0 ]]; then
  printf 'All checks passed.\n'
  exit 0
else
  printf '%d check(s) failed.\n' "$errors" >&2
  exit 1
fi