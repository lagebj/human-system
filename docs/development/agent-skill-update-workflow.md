# Updating a pinned Agent Skill

An Agent Skill update is a **methodological change**. An upstream edit can alter
research behaviour, citation semantics, review criteria, or how agent
instructions are interpreted. So there is no automatic updater: no Dependabot,
no Renovate, no scheduled workflow advances these SHAs. Only this flow does.

```
upstream skill changes
        ↓
inspect the diff from the pinned SHA
        ↓
understand the behavioural / methodological change
        ↓
check for a licence change
        ↓
decide whether Human System wants it
        ↓
update the commit in .devcontainer/agent-skills.lock.json
        ↓
bash .devcontainer/sync-agent-skills.sh --required
        ↓
verify Claude / OpenCode parity (bash .devcontainer/validate-agent-parity.sh)
        ↓
bash scripts/validate.sh
        ↓
normal branch + PR
```

## Steps

1. **Get the upstream diff.** In the devcontainer cache
   (`~/.local/share/human-system-agent-skills/pinned/<id>`), `git fetch origin`
   and `git log --oneline <pinned-sha>..origin/HEAD -- <skill-path>`, then
   `git diff <pinned-sha>..<candidate-sha> -- <skill-path>`.
2. **Read the change as behaviour.** What would an agent now do differently?
   Does it change what counts as a verified citation, what a review passes, how
   a research claim is framed? If yes, that is the thing under review, not the
   line count.
3. **Check the licence.** Compare the upstream `LICENSE` at both SHAs. A licence
   change is a stop-and-reassess, not a routine bump. Update
   `THIRD_PARTY_NOTICES.md` and `agent-skill-provenance.md` if it changed.
4. **Decide.** If the change is unwanted, stay on the current pin and record
   why in the PR. If wanted, continue.
5. **Update the lock.** Edit the `commit` for that source in
   `.devcontainer/agent-skills.lock.json`. Update `agent-skills.json` only if
   the requested skill paths or purpose changed. Update the SHAs in
   `agent-skill-provenance.md` and `THIRD_PARTY_NOTICES.md`.
6. **Sync and validate.** `bash .devcontainer/sync-agent-skills.sh --required`,
   then `bash .devcontainer/validate-agent-parity.sh`, then
   `bash scripts/validate.sh`.
7. **PR.** One PR, describing the behavioural change and why it is wanted, with
   the validation output.

## What must never happen

- A skill executing from an unpinned branch (`ref: main`) at runtime.
- A locked SHA advancing without a human reading the diff.
- A licence change slipping through unremarked.
