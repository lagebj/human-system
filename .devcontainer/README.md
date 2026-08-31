# Human System Devcontainer

## What this container provides

- Node.js 24 on Debian Bookworm
- Non-root development user (`node`)
- `git`, GitHub CLI (`gh`), `curl`, `jq`, `ripgrep`
- OpenCode CLI (pinned version)
- Claude Code (via devcontainer feature)
- Agent skill synchronization for both OpenCode and Claude Code

## What this container does NOT provide

There is no application stack — no database, no web framework, no CMS, no
application server. This is a workshop for future development, not a running
application.

## Opening locally

1. Clone the repository
2. Open in VS Code
3. When prompted, reopen in the devcontainer (or use the Command Palette:
   "Dev Containers: Reopen in Container")
4. Wait for the post-create script to finish

## Opening in Codespaces

1. Create a Codespace from the repository on GitHub
2. The same `.devcontainer/devcontainer.json` is used
3. Add `OLLAMA_API_KEY` as a Codespaces secret for OpenCode Web to start
   automatically

## Authentication

### GitHub CLI

```bash
gh auth login
```

Follow the interactive prompts.

### Claude Code

Claude Code uses Claude.ai subscription authentication by default. The
devcontainer's managed settings enforce `forceLoginMethod: "claudeai"` and
clear any inherited API credentials.

On first use:

```bash
claude
```

Follow the interactive authentication flow.

### OpenCode

OpenCode requires an `OLLAMA_API_KEY` environment variable:

- **Local devcontainer**: set in a `.env` file (gitignored) or export in your
  shell
- **Codespaces**: add as a GitHub Codespaces secret

## OpenCode Web

### Start

```bash
bash .devcontainer/start-opencode.sh
```

### Stop

```bash
bash .devcontainer/stop-opencode.sh
```

In Codespaces, OpenCode Web starts automatically when `OLLAMA_API_KEY` is
available.

OpenCode Web runs on port 4096.

## Where mutable state lives

| State | Location | Persists across rebuilds |
|-------|----------|------------------------|
| Claude Code config/auth | `/home/node/.claude` (Docker volume) | Yes |
| OpenCode config | `/home/node/.config/opencode` (Docker volume) | Yes |
| Agent skills (managed) | `/home/node/.local/share/human-system-agent-skills/` | No (rebuilt) |
| Shell history | `/home/node/.bash_history` (default) | No |
| OpenCode Web logs | `/home/node/.local/state/human-system/` | No |

Volume names are prefixed with `human-system-` to avoid collision with other
devcontainers (e.g., Matchboard).

## Agent skill parity

Both Claude Code and OpenCode discover the same skills:

1. **Repo-local skills** from `.agents/skills/` (authoritative, committed)
2. **Externally managed skills** from `addyosmani/agent-skills` and
   `lagebj/agent-skills` (synchronized, symlinked)

The sync script (`sync-agent-skills.sh`) creates symlinks in both
`~/.config/opencode/skills/` and `.claude/skills/` pointing to the same
source repositories.

Run parity validation:

```bash
bash .devcontainer/validate-agent-parity.sh
```

## Tool versions

| Tool | Version | Controlled by |
|------|---------|---------------|
| Node.js | 24 | Dockerfile build arg `NODE_VARIANT` |
| OpenCode | 1.18.8 | Dockerfile build arg `OPENCODE_VERSION` |
| Claude Code | latest | Devcontainer feature (auto-updated) |
| GitHub CLI | latest | Devcontainer feature |

To update OpenCode, change `OPENCODE_VERSION` in both the Dockerfile and
`devcontainer.json` build args, then rebuild the container.

## Validation

Run the full environment validation:

```bash
bash .devcontainer/validate.sh
```

This checks tool availability, agent parity, worktree integrity, secret
absence, and manuscript integrity.

## Troubleshooting

### Container build fails without credentials

The build does not require any external credentials. If it fails, check that
the Dockerfile builds correctly on its own:

```bash
docker build -f .devcontainer/Dockerfile .devcontainer/
```

### Claude Code authentication not persisting

The Claude config directory is a Docker volume. It should persist across
container rebuilds. If it resets, check that the volume mount in
`devcontainer.json` is working:

```bash
ls -la /home/node/.claude/
```

### OpenCode skills not appearing

Re-run the skill sync:

```bash
bash .devcontainer/sync-agent-skills.sh --required
```

### OpenCode Web not starting (Codespaces)

Check that `OLLAMA_API_KEY` is set as a Codespaces secret. Without it,
OpenCode Web will not start but the container will still function normally
for terminal-based OpenCode usage.