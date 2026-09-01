# Decision Record: Author Corpus Integration

**Date:** 2026-08-31
**Status:** Proposed
**Supersedes:** None
**Superseded by:** None

---

## Problem

The public-authorship programme (ADR 005) and foundational context/living voice programme (ADR 006) established durable permissions and principles for Human System public writing. However, abstract rules alone cannot reliably produce authorial voice.

The repository lacked:
- Concrete corpus evidence of how the author actually writes
- Retrieval mechanisms tied to cognitive surface (reflective, technical, argumentative, etc.)
- Negative evidence (author-rejected AI patterns)
- Preference for human-authored seeds over AI-generated drafts
- Guardrails against harvesting private/confidential material

Without corpus-backed authorship, agents risk producing prose that follows abstract rules but sounds nothing like the author.

---

## Decision

### 1. Extensive author corpus integrated

Add `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/` containing:

- **38 direct user messages** as primary voice evidence
- Organized by cognitive surface: reflective (6), technical (18), argumentative (3), explanatory (2), coaching (2), meta (6)
- `samples.jsonl` — structured corpus with provenance metadata (id, date, genre, context, text, provenance_class, transformation, source_scope, redaction)
- Seed files per surface (`seed-reflective.md`, `seed-technical.md`, etc.) for quick retrieval
- `rejected/author-reactions.md` — author rejections of AI-generated patterns (negative evidence)
- `PRIVACY_AND_REDACTION.md` — redaction guidance before commit
- `CORPUS_INDEX.md` — sample inventory
- `CORPUS_POLICY.md` — usage constraints
- `workflow/VOICE_CORPUS_WORKFLOW.md` — retrieval and editing workflow

### 2. Public-writing skill updated

Update `public-writing/SKILL.md` core responsibilities to:
- Retrieve relevant corpus samples by cognitive surface
- Prefer human-authored seed + corpus evidence over polished AI draft + style rewrite
- Load rejected-ai evidence during final review when available

### 3. Retrieval guidance established

For important public prose:
- Retrieve small relevant subset, not entire corpus
- Aim for diversity within surface: at least one longer sample, one showing uncertainty/correction, one from different topic when useful
- Avoid retrieving only memorable one-liners
- Prefer `author-original` and `direct-user-message` as primary voice evidence
- Keep `author-approved-assisted` secondary
- Load rejected-ai material during editing/review

### 4. Generation pipeline preference

New pipeline prefers:
> author seed + relevant corpus + conceptual context → rough thought → selective structure → evidence/review → minimal normalization

over:
> concept → polished AI draft → style rewrite → humanization

### 5. Guardrails

- Do not treat corpus typos as requirement to reproduce typos
- Do not clean the raw corpus
- Do not create numeric style targets from diagnostics
- Do not create AI detector, idiolect score, banned-word list, humour quota, sentence-length quota, list quota, or mandatory structure
- Keep manuscript rules isolated
- Add architectural validation for corpus provenance/index integrity and routing only
- Redact or exclude samples containing confidential/private details before commit

### 6. Resource maps updated

Update `RESOURCE_MAP.md` documenting corpus location, organization, and retrieval guidance.

### 7. Persistence

Corpus is repo-local under `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/`. Devcontainer skill sync automatically links repo-local skills. No manual post-rebuild steps required.

---

## Consequences

### Positive

- Authorial voice now grounded in corpus evidence, not abstract rules alone
- Retrieval by cognitive surface enables appropriate voice for different subjects
- Negative evidence (rejected patterns) helps prevent recurrence
- Human seed preference reduces AI-shaped prose at source
- Privacy guardrails protect confidential material
- Corpus survives fresh devcontainer/rebuild sessions

### Negative

- Corpus adds repository complexity
- Retrieval requires judgment about cognitive surface
- Authors may over-rely on corpus samples rather than developing own voice

### Risks and mitigations

- **Risk:** Corpus becomes phrase library to copy from.
  **Mitigation:** Explicit policy against phrase copying; corpus is evidence of language patterns, not template source.

- **Risk:** Numeric style targets created from corpus diagnostics.
  **Mitigation:** Explicit prohibition in CORPUS_POLICY.md and public-writing skill.

- **Risk:** Private/confidential material leaked.
  **Mitigation:** PRIVACY_AND_REDACTION.md guidance, pre-commit review, provenance metadata tracks redaction status.

- **Risk:** Manuscript rules leak into public writing or vice versa.
  **Mitigation:** Corpus isolated to writing_voice; manuscript rules remain in book_work.

---

## Related records

- ADRs: `005-public-authorship-and-language-programme.md`, `006-foundational-context-and-living-voice.md`
- Skills: `public-writing`, `human-systems-context`
- Resources: `public-language.md`, `author-corpus/`

---

## Implementation evidence

- `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/` created with 38 samples
- `.agents/skills/public-writing/SKILL.md` updated with corpus retrieval
- `.agents/skills/human-systems-context/resources/context/RESOURCE_MAP.md` updated

---

## Supersedes

None.

---

## Superseded by

None.

---

## History

### 2026-08-31

Decision record created. Extensive author corpus (38 direct user messages) integrated with retrieval by cognitive surface.
