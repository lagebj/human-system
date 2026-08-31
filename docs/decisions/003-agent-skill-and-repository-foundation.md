# Decision Record: Agent Skill, Licensing, Workflow and Validation Foundation

**Date:** 2026-08-31
**Status:** Accepted
**Relates to:** `002-repository-operating-model-and-source-authority.md` (task
classes); does not supersede it.
**Superseded by:** None

---

## Problem

ADR 002 established the operating model (task classes 1–7, operational vs
intellectual authority). It did not decide how the repository actually equips a
coding agent: which Agent Skills exist, where they come from, when each must be
used, under what licences the repository operates, or how any of it is
validated. Those need durable decisions before substantive paper and
publication work begins, so that the answers do not get re-litigated per
session.

Five coupled decisions are recorded here as one foundation.

---

## Decision

### 1. Pinned upstream Agent Skill dependency model

Generic Agent Skill capabilities are consumed from **pinned upstream commits**.
Human System owns integration and domain behaviour; it does not fork generic
capabilities without a demonstrated reason.

- Desired sources: `.devcontainer/agent-skills.json` (intent).
- Pinned commits: `.devcontainer/agent-skills.lock.json` (the only thing the
  sync executes). Every entry is a 40-hex commit SHA. No `ref`/`branch`.
- `.devcontainer/sync-agent-skills.sh` fetches each locked commit into a
  devcontainer-managed cache and symlinks the selected skill into **both**
  `~/.config/opencode/skills/` and `<workspace>/.claude/skills/`. Symlinks and
  checkouts are gitignored — no tracked churn.
- No automatic updater. Not Dependabot, not Renovate, not a scheduled workflow.
  Updates go through `docs/development/agent-skill-update-workflow.md`: inspect
  the diff, understand the behavioural change, check the licence, then a
  reviewed lock edit and PR. An Agent Skill change is a methodological change.
- Selected now: `research` (`drader/researcher_agent`, CC-BY-NC-4.0, wrapped by
  `research-pressure-test`), `grounded-citations`
  (`NousResearch/hermes-agent`, MIT), `writing-for-agents`
  (`mattpocock/skills`, MIT). Provenance and rejected candidates:
  `docs/development/agent-skill-provenance.md`.
- The pre-existing `addyosmani/agent-skills` and `lagebj/agent-skills`
  collections continue to sync from `main` as before; re-pinning those whole
  collections is out of scope for this decision.

### 2. Task-class-driven skill activation

Installing skills is not enough. `.agents/workflow.json` is the **authoritative**
map from ADR 002 task class to skill activation: `required`, `conditional`
(each with a `when` trigger), `excluded`, wrapper relationships, sequences, and
the `clean_reader` and `explicit_human_intent_gates` blocks.

- `AGENTS.md` is the bootloader and points at `.agents/workflow.json`; it does
  not restate the map.
- `human-system-owned` skills: `human-systems-context`, `concept-development`,
  `research-pressure-test`, `paper-development`, `reader-test`,
  `publication-review`. `pinned-upstream`: `research`, `grounded-citations`,
  `writing-for-agents`. There is no separate `manuscript-writing` skill;
  manuscript rules live in `human-systems-context` + `book_work/` and load only
  for class 5 (`load_manuscript_rules`).
- `reader-test` runs against a reader that does not receive
  `human-systems-context` or any project-internal context (`clean_reader`). It
  is never required for devcontainer startup or for validation, and never needs
  AI-provider authentication.
- `manuscript-work` and `publication` require explicit user intent.
  Publication preparation (`publication-review`) never grants publication.

### 3. Multi-license repository model

Human System is a multi-license repository, expressed as REUSE/SPDX metadata in
`REUSE.toml` (authoritative) and explained in `LICENSE.md`.

| Material | Licence |
|---|---|
| Human System-authored software, tooling, operational config/docs | `MPL-2.0` |
| Deliberately published intellectual material (none yet) | `CC-BY-NC-SA-4.0` |
| Working intellectual material; the manuscript | `LicenseRef-All-Rights-Reserved` |
| Third-party material | upstream terms, unchanged (`THIRD_PARTY_NOTICES.md`) |

Presence of a file in Git is not publication and not a licence grant.
Third-party Agent Skills are never relicensed and are not vendored.

### 4. One canonical validation implementation

`scripts/validate.sh` is the single repository-owned validation entrypoint,
composed of focused checks in `scripts/lib/` plus self-tests in
`scripts/tests/`. It is deterministic, non-interactive, needs no Claude or
OpenCode authentication, and does no live web research.

`.github/workflows/validate.yml` runs **that same command** on pull requests to
`main` and pushes to `main`. CI installs only what the checks need (`reuse`);
it contains no policy logic of its own. Minimal permissions (`contents: read`),
actions pinned by SHA, no deployment, no Pages.

### 5. Prove validation before requiring it

The `validate` status check is **deliberately not required** on `main` yet.
`main` protection currently requires a PR, blocks force pushes, and blocks
branch deletion — no required status check, no mandatory second reviewer (this
repository is maintained by one author with coding agents; a mandatory second
approval would be process theatre).

Follow-up, after the `validate` workflow has several stable green runs: make the
`validate` check required on `main` (GitHub → Settings → Rules/Branches →
`main` ruleset → Require status checks to pass → add `validate`). That is the
entire remaining infrastructure action. Do not add a required check that has
not yet proven stable.

---

## Consequences

### Positive

- Runtime never follows an unpinned upstream skill branch.
- Which skills apply to a task is written down and validated, not remembered.
- Licensing boundaries are machine-checkable.
- Local and CI validation cannot drift — they are the same command.
- The path to a required check is explicit and small.

### Negative / risks

- The pinned-skill cache needs network for the first fetch of each commit.
- REUSE lint needs the `reuse` tool; it runs in CI and is skipped-with-notice
  locally when absent.
- `.agents/workflow.json` is another operational file to keep current; the
  validator guards its internal consistency but not its wisdom.

---

## Related records

- ADRs: `002-repository-operating-model-and-source-authority.md`
- `docs/development/agent-skill-provenance.md`,
  `docs/development/agent-skill-update-workflow.md`,
  `docs/development/research-writing-agent-workflow.md`
- `.agents/workflow.json`, `REUSE.toml`, `LICENSE.md`, `THIRD_PARTY_NOTICES.md`
- `scripts/validate.sh`, `.github/workflows/validate.yml`

## Implementation evidence

- Branch `chore/agent-skills-licensing-workflow-bootstrap`.
- `bash scripts/validate.sh` — all checks passed.
- `bash scripts/tests/run.sh` — 9/9 expectations met.
- `bash .devcontainer/validate-agent-parity.sh` — all checks passed.

## History

### 2026-08-31

Record created.
