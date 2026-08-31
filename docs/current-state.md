# Current State

**Last verified:** 2026-08-31
**Operating model:** `docs/decisions/002-repository-operating-model-and-source-authority.md` (Accepted)
**Foundation:** `docs/decisions/003-agent-skill-and-repository-foundation.md` (Accepted)
**Publication architecture:** `docs/decisions/004-public-site-and-publication-architecture.md` (Proposed)
**Public authorship:** `docs/decisions/005-public-authorship-and-language-programme.md` (Proposed)

This file is a mandatory read before any work. Keep it short. Update it only
when its subject changes (ADR 002 §8), not after every conceptual note.

---

## What this project is

The working home for an evolving body of thought about understanding and
intervening responsibly in human systems when the right action depends on
context. The recurring entrypoint is consulting and technical/organizational
work. "It depends, therefore identify what it depends upon" is a recurring
thread.

## Current direction

- Shorter, narrower papers are the intended near-term way of testing ideas.
- The book manuscript is preserved as one possible future synthesis. It is not
  the primary output and is inactive by default.
- Enablement and the Trojan Horse Movement Pattern are treated as applied
  consequences of the thinking, not its centre.
- The newer conceptual direction lives in
  `resources/source/core_stance/contextual-intervention.md`.

## Development environment

- Dedicated devcontainer is operational (Node 24, non-root `node` user,
  `git`/`gh`/`jq`/`ripgrep`, OpenCode CLI, Claude Code).
- Claude Code and OpenCode are both available, with agent-skill parity between
  them, including three **pinned** upstream skills (`research`,
  `grounded-citations`, `writing-for-agents`) synced by commit SHA.
- Astro static site in `site/` for public publication (no backend, no component
  framework, no analytics).
- GitHub Pages deployment via GitHub Actions (deploys only from `main` branch).

- ADR 002 operating model (task classes 1–7); ADR 003 skill/licensing/workflow/
  validation foundation; ADR 004 publication architecture (proposed); ADR 005
  public authorship and language programme (proposed).
- `AGENTS.md` bootloader → `.agents/workflow.json` (authoritative task-class →
  skill-activation map).
- Skills: `human-systems-context` plus Human System-owned `concept-development`,
  `research-pressure-test` (wraps pinned `research`), `paper-development`,
  `public-writing`, `reader-test`, `publication-review`; pinned upstream
  `research`, `grounded-citations`, `writing-for-agents`.
- Multi-license model: `REUSE.toml` + `LICENSE.md` (MPL-2.0 tooling;
  CC-BY-NC-SA-4.0 for published material; all-rights-reserved working
  material and manuscript; upstream terms for third-party).
- `CONTRIBUTING.md`, `SECURITY.md`, `CITATION.cff`, `THIRD_PARTY_NOTICES.md`,
  issue templates.
- One validator: `bash scripts/validate.sh` (also run by
  `.github/workflows/validate.yml` on PRs to and pushes to `main`). Validation
  includes site build and publication-boundary regression test.
- Working-session playbook (`resources/playbooks/working-session.md`).
- `main` protection (existing ruleset "default", unchanged): PR required,
  force-push blocked, deletion blocked, linear history. The `validate` status
  check is intentionally **not** required yet (ADR 003 §5).
- Security: Dependabot alerts + dependency graph, Dependabot security fixes, and
  private vulnerability reporting are enabled. A Dependabot version-update
  config is deferred (no package manifests). Agent Skills have no auto-updater.

## Inactive

- Manuscript editorial passes. No pass is active. `manuscript/human.md` is
  preserved and not being edited.
- The five-class editorial task model from ADR 001 (superseded).

## Operationally authoritative files

`AGENTS.md` → `.agents/workflow.json` →
`.agents/skills/human-systems-context/SKILL.md` → `docs/decisions/` (ADR 002 +
ADR 003 current; ADR 001 superseded except manuscript pass mechanics; ADR 004
proposed) → `docs/current-state.md` → `resources/playbooks/working-session.md`.

Canonical manuscript: `manuscript/human.md`. The copy at
`resources/source/book_work/human.md` is a stale snapshot, context-loading only.

Publication boundary: `papers/published/` is the only content eligible for the
public website. `papers/working/`, `manuscript/`, `inbox/`, `.agents/`, and
`resources/` are structurally excluded from the site build.

## Unresolved tensions

- Which established traditions the thinking overlaps, and where its framing is
  actually distinctive, is not yet worked out (see
  `contextual-intervention.md` → "Relationship to established traditions").
- The operational/intellectual authority split relies on judgment, not a
  mechanical rule.
- `SKILL.md` and `resources/context/OPERATING_CONTEXT.md` still carry unrelated
  personal domains (youth football, Matchboard) inherited from the broader
  context package; whether they belong in this repository is undecided.
- Publication architecture is implemented but not yet proven in production (no
  papers published yet, GitHub Pages deployment not yet tested on merge).
- Public authorship model is newly implemented; existing working papers may
  need remediation to align with `public-language.md`.

## Active paper development

- **"It Depends" series** — Working draft of Paper 1 exists
  (`papers/working/it-depends/paper-01-it-depends.md`). Series map and research
  notes in place. Load-bearing claims identified for pressure-testing. Not for
  publication.

## Likely next work

- After the `validate` workflow shows several stable green runs: make the
  `validate` status check **required** on `main` (ADR 003 §5). That is the only
  remaining bootstrap step.
- Pressure-test load-bearing claims in Paper 1 using `research-pressure-test`
  and `grounded-citations` skills.
- Run `reader-test` on Paper 1 draft (clean context).
- Verify GitHub Pages deployment succeeds on merge and the deployed site is
  accessible at `https://lagebj.github.io/human-system/`.
- Decide whether to continue refining Paper 1 or begin Paper 2 (Best Practice).

---

## History

Historical manuscript-pass narrative is not kept on this surface. See:

- `docs/editorial-notes.md` — full editorial pass history
- `docs/logs/editing-log.md` — dated pass log
- `docs/reports/archive/` — archived historical reports
- Git history

Last manuscript state recorded before this reset: revision
"observational-reorientation", 8,918 words, 7 chapters, all editorial passes
complete, full read-through still pending. That state is unchanged by this
reset; it is simply no longer tracked here while manuscript work is inactive.
