# Current State

**Last verified:** 2026-08-31
**Operating model:** `docs/decisions/002-repository-operating-model-and-source-authority.md` (Accepted)

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
  them.
- No application stack (no database, web framework, CMS, or app server). This is
  a workshop for future work.

## Active

- ADR 002 operating model and the two-kinds-of-authority split.
- `AGENTS.md` bootloader + task classes 1–7.
- `human-systems-context` skill routing by task class.
- Working-session playbook (`resources/playbooks/working-session.md`).
- Repository validation (`scripts/validate-repo.sh`).

## Inactive

- Manuscript editorial passes. No pass is active. `manuscript/human.md` is
  preserved and not being edited.
- Publication / website implementation. Not established. Not in scope until
  explicitly started.
- The five-class editorial task model from ADR 001 (superseded).

## Operationally authoritative files

`AGENTS.md` → `.agents/skills/human-systems-context/SKILL.md` → `docs/decisions/`
(ADR 002 current; ADR 001 superseded except manuscript pass mechanics) →
`docs/current-state.md` → `resources/playbooks/working-session.md`.

Canonical manuscript: `manuscript/human.md`. The copy at
`resources/source/book_work/human.md` is a stale snapshot, context-loading only.

## Unresolved tensions

- Which established traditions the thinking overlaps, and where its framing is
  actually distinctive, is not yet worked out (see
  `contextual-intervention.md` → "Relationship to established traditions").
- The operational/intellectual authority split relies on judgment, not a
  mechanical rule.
- `SKILL.md` and `resources/context/OPERATING_CONTEXT.md` still carry unrelated
  personal domains (youth football, Matchboard) inherited from the broader
  context package; whether they belong in this repository is undecided.
- No paper exists yet, so the paper-development workflow (Class 4) is untested in
  practice.

## Likely next work

- Draft the first short paper to test the Class 4 workflow.
- A Class 3 pass mapping `contextual-intervention.md` propositions against
  established theory.
- Decide the fate of the inherited non-human-systems domains in the skill.

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
