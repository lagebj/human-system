# Surface Profile: Technical Reasoning

**Version:** 1.0  
**Compiled:** 2026-09-01  
**Evidence base:** 19 technical samples (Matchboard, music, general technical)  
**Provenance:** `direct-user-message`

---

## Purpose

This profile describes author language behaviour specific to **technical reasoning** surfaces (architecture decisions, implementation discussions, feature gates, data model changes). Use this in addition to the base `LANGUAGE_MODEL.md`.

---

## Strongly supported observations (this surface)

### 1. Decision questions
**Observation:** Direct yes/no or option questions that require decisions.

**Evidence:**
- `mb-2026-08-29-rego`: "Should we remove this Rego gate entirely or should we default to true?"
- `mb-2026-08-30-finalisation`: "do we really need all of these?"
- `mb-2026-08-29-spec-transfer`: "Is this transferrable to a technical spec and a coding agent prompt?"

**Confidence:** high

### 2. Technical shorthand without explanation
**Observation:** Uses domain terms (`locking`, `backfill`, `evidence`, `state`, `assignment`) without definition.

**Evidence:**
- `mb-2026-08-30-backfill`: "automatic backfill should not distribute 9 players evenly across 3 teams"
- `mb-2026-08-26-existing-data`: "opponent level evidence"
- `mb-2026-08-26-multiselect`: "us rating vs them rating"

**Confidence:** high

### 3. Shorter sentences on average
**Observation:** Sentences are shorter than reflective surface, but variation still present.

**Evidence:**
- `mb-2026-08-29-rego`: 16 words
- `mb-2026-08-26-locking-time`: 40 words (longer, but functional)
- `mb-2026-08-18-subfolder`: 12 words

**Confidence:** moderate

### 4. Direct correction when needed
**Observation:** Corrects errors or unwanted directions directly, without softening.

**Evidence:**
- `mb-2026-08-29-english`: "Do not use 'hospitering' or 'hospitant' if this is not valid english"
- `mb-2026-08-30-finalisation`: "Another thing I have noticed is all the 'complete', 'finalize', 'lock' functionality... do we really need all of these?"

**Confidence:** high

### 5. Pattern recognition across contexts
**Observation:** Notices same pattern in different technical contexts (match locking → squad locking → backfill).

**Evidence:**
- `mb-2026-08-30-backfill`: "Same with Events and 'drafts', locking players etc."
- `mb-2026-08-30-finalisation`: extends time-based state principle across stages

**Confidence:** high

### 6. Exception handling retained
**Observation:** After proposing simplification, retains necessary exceptions.

**Evidence:**
- `mb-2026-08-26-locking-time`: "Post-match report has to be open until submitted though"
- `mb-2026-08-26-postmatch-correction`: retains post-match correction for last-minute changes

**Confidence:** high

### 7. Implementation awareness
**Observation:** Considers implementation consequences, not just abstract design.

**Evidence:**
- `mb-2026-08-30-kicks-weekly`: "I am also not sure I understand what you mean by 'true matchday mode' here"
- `mb-2026-08-26-existing-data`: "In regards of running this on existing data, the current player attributes are representative for all existing seasons and matches luckily"

**Confidence:** high

### 8. Ordinary language for technical concepts
**Observation:** Explains technical concepts in ordinary language when possible.

**Evidence:**
- `mb-2026-08-26-locking-time`: "A match/round is configurable all the way up to or around kick-off time, then it locks automatically?"
- `mb-2026-08-30-backfill`: describes backfill logic in plain terms

**Confidence:** high

---

## Shared with other surfaces

These behaviours appear across multiple surfaces:

- Simple connectives
- Questions in reasoning
- Sentence length variation
- Direct correction
- Technical shorthand (but domain-specific)

---

## Things not yet known (this surface)

- How technical writing varies between architecture vs. implementation details
- Whether uncertainty patterns differ for decisions vs. explanations
- How the author handles technical disagreement in writing (vs. chat)
- Whether humour appears in technical writing under stress/deadline

**Confidence:** low

---

## Generation guidance (this surface)

### Do
- Use technical shorthand without over-explaining (context supports it)
- Ask direct decision questions
- Notice patterns across technical contexts
- Retain necessary exceptions when simplifying
- Consider implementation consequences
- Use ordinary language for technical concepts when possible
- Correct errors directly

### Do not
- Over-explain domain terms when context is clear
- Soften corrections unnecessarily
- Force abstract framing when concrete language works
- Ignore implementation reality for design purity
- Assume every technical decision needs philosophical grounding

---

## Relationship to thought movement (this surface)

For substantial technical writing, load `THOUGHT_MOVEMENT_MODEL.md` and prioritize:

- Pattern 1: Starting from concrete irritation
- Pattern 2: Questioning the default mechanism
- Pattern 3: Proposing a simpler model
- Pattern 4: Discovering a counterexample or boundary condition
- Pattern 6: Adding another time horizon
- Pattern 12: Expanding scope mid-thought
- Pattern 13: Noticing pattern across domains

---

## Held-out samples (this surface)

- `mb-2026-08-29-collab-counter` — reserve for evaluation

---

## Update protocol

When new technical evidence is added:

1. Compare against existing observations
2. Strengthen, weaken, or contradict as warranted
3. Update confidence levels
4. Add new observations if behaviour is not captured
5. Retain uncertainty where evidence is mixed
