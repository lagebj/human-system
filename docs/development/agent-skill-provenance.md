# Agent Skill Provenance

Every external Agent Skill Human System touched, what was decided, and why.
Inspected 2026-08-31. Pins live in `.devcontainer/agent-skills.lock.json`;
licence texts in `THIRD_PARTY_NOTICES.md`.

The rule: **own the integration and the domain-specific behaviour; pin generic
capabilities upstream until actual use shows a reason to fork.**

---

## researcher-agent

- **Upstream:** <https://github.com/drader/researcher_agent>
- **Selected path:** `skills/research`
- **Inspected commit:** `d9937f6e5f223efca7ac239d464bf4d455a415c1`
- **Pinned commit:** `d9937f6e5f223efca7ac239d464bf4d455a415c1`
- **Upstream licence:** CC-BY-NC-4.0 (a content licence; NonCommercial;
  Attribution). Copyright Oğuz Gençer.
- **Consumed directly:** yes, unmodified, pinned.
- **Wrapped:** yes — by the Human System-owned `research-pressure-test` skill.
- **Reimplemented from idea:** no.
- **Human System purpose:** generic research mechanics — literature search,
  source verification, PRISMA 2020 systematic review, Socratic
  question-formulation, claim-by-claim fact-check. It explicitly "defers all
  substantive judgment to the user" and produces evidence maps rather than
  interpretation, which fits Human System's needs. `research-pressure-test`
  orchestrates it toward collision-with-reality: observation vs inference,
  overlapping and competing theory, boundary conditions, falsifiers.
- **Licensing note:** CC-BY-NC-4.0 is compatible with this non-commercial
  project. Attribution to Oğuz Gençer is retained in `THIRD_PARTY_NOTICES.md`.
  The wrapper text is original Human System work and does not reproduce
  upstream wording. If Human System ever needs to modify the skill's own text,
  revisit this (CC-BY-NC-4.0 permits adaptation with attribution and
  non-commercial use; a modified copy would need to be marked as changed).

## hermes-agent

- **Upstream:** <https://github.com/NousResearch/hermes-agent>
- **Selected path:** `skills/research/grounded-citations`
- **Inspected commit:** `3aee290899e478c5fdfb6a241ef62758a49829b3`
- **Pinned commit:** `3aee290899e478c5fdfb6a241ef62758a49829b3`
- **Upstream licence:** MIT. Copyright Nous Research.
- **Consumed directly:** yes, unmodified, pinned.
- **Wrapped:** no.
- **Reimplemented from idea:** no. Human System does **not** build a separate
  evidence ledger.
- **Human System purpose:** deterministic source identity and citation
  provenance. A stdlib-only `scripts/sources.py` owns the `url → [n]` ledger;
  sources are registered at retrieval time, the Sources block is rendered
  mechanically, and `verify` checks claim-to-evidence integrity (with an
  `--evidence` gate for verbatim quotes). This is exactly the invariant Human
  System wants: sources captured when evidence is discovered, not reconstructed
  when prose is nearly finished.
- **Adapter:** none needed. The skill's `--ledger` / `HERMES_CITATION_LEDGER`
  override handles running it from the pinned checkout location; Human System
  documents that in the research/writing workflow rather than adding code.

## mattpocock-skills

- **Upstream:** <https://github.com/mattpocock/skills>
- **Selected path:** `skills/productivity/writing-for-agents`
- **Inspected commit:** `6654f6b60cd9d5be8b54c6fafe44346dabeb3b76`
- **Pinned commit:** `6654f6b60cd9d5be8b54c6fafe44346dabeb3b76`
- **Upstream licence:** MIT. Copyright Matt Pocock.
- **Consumed directly:** yes, unmodified, pinned.
- **Wrapped:** no.
- **Reimplemented from idea:** no.
- **Human System purpose:** writing material that an agent consumes —
  `AGENTS.md`, a `SKILL.md`, `.agents/workflow.json`, playbooks, context
  pointers. Its levers (context pointers, information hierarchy, progressive
  disclosure, positive prompting over negation, leading words, single source of
  truth) are used when authoring this repository's operational text. It must
  **not** govern papers, manuscript prose, conceptual notes, or public
  intellectual writing — enforced by `.agents/workflow.json` (only conditional
  for class 1).

## writing-skills (inspected, not used)

- **Upstream:** <https://github.com/msimchowitz/writing-skills>
- **Inspected path:** `for-agents/writing` (a router)
- **Inspected commit:** `214981fe02326f27b0fc8790d00eb4b731607073`
- **Upstream licence:** MIT. Copyright Max Simchowitz.
- **Decision:** **not installed.** The useful idea — "load the smallest
  relevant writing capability" — is already provided by `human-systems-context`
  plus `.agents/workflow.json`. Installing a second writing router would create
  overlapping routers (the thing §3.2/§4.4 of the bootstrap warns against). A
  single downstream specialist (e.g. `academic-voice` or `paper-writing`) could
  be pinned later if `paper-development` proves insufficient in practice —
  deferred until then.

## anthropics-skills (inspected, reimplemented from idea)

- **Upstream:** <https://github.com/anthropics/skills>
- **Inspected path:** `skills/doc-coauthoring`
- **Inspected commit:** `3b3fad96af16a10759d930941b4520ba0c40edae`
- **Upstream licence:** ambiguous. The repository README states many skills are
  Apache-2.0, the source-available document skills carry a proprietary
  `LICENSE.txt`, but `skills/doc-coauthoring` has **no** `LICENSE.txt` and no
  `license:` frontmatter, and the repository has no root `LICENSE` file.
- **Decision:** **do not copy.** Human System's `reader-test` skill was written
  independently. The *idea* it draws on is the "Reader Testing" stage of the
  `doc-coauthoring` workflow — testing an artifact with a reader who lacks the
  authoring context. No wording was reproduced. Human System's `reader-test`
  also adds the project-specific requirement that the reader must not inherit
  `human-systems-context` or any project-internal context, and the constraint
  that it must never be required for devcontainer startup or repository
  validation.

---

## Update flow

Locked SHAs are never advanced automatically. See
`docs/development/agent-skill-update-workflow.md`.
