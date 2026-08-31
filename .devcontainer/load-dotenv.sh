#!/usr/bin/env bash
#
# Load workspace .env into the current environment.
#
# Meant to be *sourced*, not executed:
#
#   . .devcontainer/load-dotenv.sh
#
# Environment precedence (highest to lowest):
#
#   1. Already-exported environment variables (Codespaces secrets, parent
#      process, or explicit shell export). These are NEVER overwritten.
#   2. Values from the gitignored .env at the workspace root. These fill
#      in anything not already set.
#
# In GitHub Codespaces, secrets are injected before this script runs, so
# .env loading is skipped entirely — the Codespaces secret values take
# precedence and .env is never present (gitignored, never pushed).
#
# The devcontainer wires this into shell startup (see post-create.sh) so
# that .env values are present in every terminal, in the VS Code environment
# probe, and in the lifecycle scripts — without committing secrets.
#
# This script is idempotent: sourcing it again only fills variables that
# are not yet set, so stale values from a previous source are not refreshed
# (which is intentional — see Matchboard's load-local-env.sh for the same
# design).

# --- Codespaces guard --------------------------------------------------------
# In Codespaces, secrets are injected as environment variables by the platform
# before any lifecycle or shell script runs. The .env file is gitignored and
# never pushed, so it does not exist in Codespaces. Skip entirely to avoid
# any possibility of a stale or accidental .env overwriting Codespaces secrets.
if [[ "${CODESPACES:-false}" == "true" ]]; then
  return 0 2>/dev/null || exit 0
fi

# --- Resolve workspace root --------------------------------------------------
# Prefer the well-known devcontainer path, then an explicit override, then the
# git top level, then the current directory.
if [[ -n "${HUMAN_SYSTEM_WORKSPACE:-}" ]]; then
  __hs_workspace="${HUMAN_SYSTEM_WORKSPACE}"
elif [[ -d "/workspaces/human-system" ]]; then
  __hs_workspace="/workspaces/human-system"
elif __hs_git_root="$(git rev-parse --show-toplevel 2>/dev/null)"; then
  __hs_workspace="${__hs_git_root}"
else
  __hs_workspace="$(pwd)"
fi

__hs_env_file="${__hs_workspace}/.env"

if [[ -f "${__hs_env_file}" ]]; then
  # Read each KEY=VALUE line and export only variables that are not already
  # set in the environment. This ensures that Codespaces secrets, container
  # environment variables, and explicitly-exported shell variables always take
  # precedence over .env values.
  #
  # We avoid `set -a; source .env` because that unconditionally overwrites
  # every variable, breaking the precedence guarantee.
  while IFS= read -r __hs_line || [[ -n "${__hs_line}" ]]; do
    # Skip blank lines and comments.
    __hs_line="${__hs_line#"${__hs_line%%[![:space:]]*}"}"
    [[ -z "${__hs_line}" || "${__hs_line}" == \#* ]] && continue

    # Split on the first = only (values may contain =).
    __hs_key="${__hs_line%%=*}"
    __hs_value="${__hs_line#*=}"

    # Strip surrounding double quotes from the value (the common .env format).
    __hs_value="${__hs_value#\"}"
    __hs_value="${__hs_value%\"}"

    # Only set if not already present in the environment.
    if [[ -z "${!__hs_key+x}" ]]; then
      export "${__hs_key}=${__hs_value}"
    fi
  done < "${__hs_env_file}"
fi

unset __hs_workspace __hs_env_file __hs_git_root __hs_line __hs_key __hs_value
