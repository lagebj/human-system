# Decision Record: Thought Trails and Intellectual Depth Integration

**Date:** 2026-08-31
**Status:** Proposed
**Supersedes:** None
**Superseded by:** None

---

## Problem

The corpus-backed authorship integration (ADR 007) successfully preserved authorial idiolect but exposed a new failure mode: chat-derived language is authentic yet too compressed for substantial reader-facing thought.

Short direct messages capture how the author expresses a thought but not how the author develops a thought over time. The system lacked:
- Evidence of intellectual depth and sustained examination
- Examples of thought changing mid-stream
- Unfinished thinking that remains productive
- Long-form prose carrying thought over length
- Distinction between elaboration (more words), excavation (deeper examination), and movement (thought changes)

Without depth evidence, agents risk producing prose that sounds like the author but remains at surface level — authentic idiolect without intellectual journey.

---

## Decision

### 1. Thought trails integrated

Add thought trails to `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/thought-trails/`:

- **8 thought trail sequences** tracking how author develops thought over time
- Organized by domain: human-system (2), matchboard (5), coaching (1)
- Each trail contains: id, title, domain, date_range, fragment_count, movement array, provenance_class
- Movement captures cognitive shifts: "public prose feels AI-shaped" → "uncertainty clarified" → "clean language rejected" → "emotional range added" → "processed rewrite rejected" → "corpus-backed idiolect introduced" → "chat-shaped compression discovered" → "thought-depth layer requested"
- Retrieved by topic similarity AND cognitive-movement similarity

### 2. Unfinished evidence category added

Add `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/unfinished/`:

- `authorship-depth-open-question.md` — explicit record that depth does not require closure
- Enables system to learn that unresolved can be productive, not merely incomplete

### 3. Substantial-writing retrieval extended

For substantial conceptual writing (papers, essays, long-form Human System pages):
- Retrieve current author seed
- Retrieve relevant raw idiolect samples (as before)
- Retrieve 2–4 thought trails by topic AND movement similarity
- Retrieve long-form depth reference where appropriate
- Cross-domain retrieval allowed for thinking patterns, never as domain evidence

### 4. Private pre-draft depth exploration added

Before drafting substantial work:
- Investigate what sits underneath the seed
- What complicates it
- What examples change it
- What another actor sees
- What boundary conditions appear
- What remains unresolved

Do not map these questions directly to public headings. This is private exploration, not outline generation.

### 5. Elaboration/excavation/movement distinction established

- **Elaboration**: more words around the same proposition (avoid when possible)
- **Excavation**: deeper examination of the proposition (prefer)
- **Movement**: the proposition/question itself changes (prefer most)

### 6. "Stay with it" principle added

For substantial work: do not stop merely because the proposition is understandable. Stay until something meaningful changes in:
- framing
- confidence
- example
- actor
- boundary
- connection
- question
- interpretation

No word-count target. Longer must not mean cleaner.

### 7. Idiolect protection reinforced

Added depth must not reintroduce:
- consultant prose
- polished symmetry
- formal transitions
- synonym normalization
- generic section templates
- abstract noun inflation
- automatic conclusions

### 8. Long-form candidates audited

Classify provenance conservatively:
- `author-original`
- `direct-user-message-longform`
- `author-approved-assisted`
- `assisted-unknown-proportion`
- `unknown`

Assisted/uncertain material is secondary depth evidence only.

### 9. Review and reader-test extended

Substantial-writing review adds:
- Did the thought change?
- Was context sufficient without chat history?
- Is length excavation/movement or padding?
- Did depth make the voice generic?
- Is an unresolved ending earned or merely underdeveloped?

### 10. Resource maps and workflows updated

Update `RESOURCE_MAP.md` documenting thought trails, unfinished evidence, and substantial-writing retrieval.

Update `public-writing/SKILL.md` with depth exploration phase and review questions.

Add `THOUGHT_TRAIL_POLICY.md` and `INITIAL_THOUGHT_MOVEMENT.md` to workflow and profiles.

### 11. Persistence

Thought trails and unfinished evidence are repo-local under `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/`. Devcontainer skill sync automatically links repo-local skills. No manual post-rebuild steps required.

---

## Consequences

### Positive

- Substantial writing now has evidence of intellectual depth, not just idiolect
- Thought trails show how author develops thinking over time, not just final expressions
- Unfinished category enables productive unresolved endings
- Distinction between elaboration/excavation/movement prevents padding
- "Stay with it" principle ensures meaningful intellectual journey
- Cross-domain retrieval captures thinking patterns beyond surface topic

### Negative

- Increased complexity in retrieval logic
- Requires judgment about topic vs. movement similarity
- May slow substantial writing workflow
- Risk of forcing depth onto surfaces that do not need it

### Risks and mitigations

- **Risk:** Thought trails become outline templates for public headings.
  **Mitigation:** Explicit instruction that pre-draft exploration questions do not map to public structure.

- **Risk:** "Stay with it" becomes word-count quota.
  **Mitigation:** Explicit "no word-count target" with focus on meaningful change in framing/confidence/example/actor/boundary/connection/question/interpretation.

- **Risk:** Elaboration disguised as excavation.
  **Mitigation:** Review questions explicitly distinguish elaboration vs. excavation vs. movement.

- **Risk:** Depth makes voice generic (consultant prose returns).
  **Mitigation:** Idiolect protection reinforced; review checks if depth made voice generic.

---

## Related records

- ADRs: `005-public-authorship-and-language-programme.md`, `006-foundational-context-and-living-voice.md`, `007-author-corpus-integration.md`
- Skills: `public-writing`, `human-systems-context`, `paper-development`, `reader-test`
- Resources: `public-language.md`, `author-corpus/` (raw samples, thought trails, unfinished, rejected)

---

## Implementation evidence

- `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/thought-trails/` created with 8 trails
- `.agents/skills/human-systems-context/resources/source/writing_voice/author-corpus/unfinished/` created
- `.agents/skills/public-writing/SKILL.md` updated with depth exploration and review
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

Decision record created. Thought trails (8 sequences) and unfinished evidence integrated for intellectual depth in substantial writing.
