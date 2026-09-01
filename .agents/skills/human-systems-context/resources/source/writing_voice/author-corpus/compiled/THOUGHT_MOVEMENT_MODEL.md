# Compiled Thought Movement Model

**Version:** 1.0  
**Compiled:** 2026-09-01  
**Evidence base:** 8 thought trails (2 human-system, 5 matchboard, 1 coaching)  
**Provenance:** `direct-user-message sequence`

---

## Purpose

This document describes **observed cognitive movement patterns** derived from the author's thought trails. It is used by generation systems to deepen substantial writing (papers, essays, long-form Human System pages) by applying similar thinking behaviours—without retrieving historical trail fragments.

This is a **derived representation**, not a template for structure. Normal reader-facing generation should load this model for substantial work, not the raw thought trails.

---

## Core movement patterns

### Pattern 1: Starting from concrete irritation
**Observation:** Thinking often begins from a specific problem or irritation in practice, not from abstract theory.

**Evidence:**
- `hs-authorship-evolution`: "I have a problem with the way the agent is writing"
- `mb-state-locking-time`: "all the 'complete', 'finalize', 'lock' functionality... do we really need all of these?"
- `mb-situational-decision-support`: "There are different modes on the coach side I think as well"

**Confidence:** high

**Use in generation:** For substantial writing, allow the opening to emerge from a concrete observation or irritation rather than abstract framing.

---

### Pattern 2: Questioning the default mechanism
**Observation:** After noticing irritation, questions whether the current approach is necessary at all.

**Evidence:**
- `mb-state-locking-time`: "do we really need all of these?"
- `mb-state-locking-time`: "Do we really need to for example 'Confirm lineup'? Finalise round? finalise match? Lock"
- `hs-authorship-evolution`: "what differs between AI writing and human writing, what sits well with human readers and what does not"

**Confidence:** high

**Use in generation:** Allow questions that challenge assumptions, not just questions that seek information within the existing frame.

---

### Pattern 3: Proposing a simpler model
**Observation:** After questioning complexity, proposes removing rather than adding. Simplicity through subtraction.

**Evidence:**
- `mb-state-locking-time`: "Actual date and clock-time should be sufficient for a lot of these finalised states"
- `mb-state-locking-time`: "If a match has started, the pre-match plan is finalised"
- `hs-it-depends-human-system`: "Systems are more than technical and org charts, systems contain humans" (simplification to core insight)

**Confidence:** high

**Use in generation:** When complexity is identified, consider whether removal/subtraction is the solution rather than refinement.

---

### Pattern 4: Discovering a counterexample or boundary condition
**Observation:** After proposing a simpler model, immediately tests it against edge cases or exceptions.

**Evidence:**
- `mb-state-locking-time`: "Post-match report has to be open until submitted though, this may be something the coach does the following day for example"
- `mb-state-locking-time`: "Any last minute changes done for a match that has not been recorded pre-match in matchboard for any reason must be possible to record post-match"

**Confidence:** high

**Use in generation:** After stating a principle, allow the thought to test itself against exceptions. This is not hedging—it is stress-testing.

---

### Pattern 5: Adding another actor or perspective
**Observation:** Thinking expands by considering how another actor (coach, player, consultant, organization) experiences the same situation.

**Evidence:**
- `mb-state-locking-time`: "this may be something the coach does the following day"
- `hs-it-depends-human-system`: "It depends on what mood you are in today, it depends on the people in your org, what knowledge they have and do not have"
- `coach-interest-belonging`: considers player perspective

**Confidence:** high

**Use in generation:** For substantial writing, ask: who else is in this system? What do they experience? How does the intervention land for them?

---

### Pattern 6: Adding another time horizon
**Observation:** Thinking shifts when considering different time scales: immediate vs. later, pre-match vs. post-match, now vs. following day.

**Evidence:**
- `mb-state-locking-time`: "Post-match report has to be open until submitted though"
- `mb-state-locking-time`: "the coach does the following day for example"
- `mb-evidence-opponent-strength`: considers evidence accumulation over time

**Confidence:** high

**Use in generation:** Ask: what changes if we look at this tomorrow? Next month? After the intervention? Before the intervention?

---

### Pattern 7: Bringing informal reality into formal model
**Observation:** Notices gap between formal structure (org chart, process, system state) and informal reality (relationships, unofficial hierarchies, actual behaviour).

**Evidence:**
- `hs-it-depends-human-system`: "official and unofficial hierarchies, decisions, official and unofficial decision makers"
- `mb-state-locking-time`: retains post-match correction for informal last-minute changes
- `mb-situational-decision-support`: "who pretends to have influence"

**Confidence:** high

**Use in generation:** For Human System writing, ask: what is the formal story here? What is the informal reality? How do they differ?

---

### Pattern 8: Returning to an earlier thought
**Observation:** Thinking circles back to earlier points, not as repetition but as deepening or correction.

**Evidence:**
- `hs-authorship-evolution`: returns to "uncertainty" multiple times across fragments
- `mb-state-locking-time`: returns to "locking" principle across multiple contexts (match, squad, backfill)

**Confidence:** moderate

**Use in generation:** Allow the thought to return to an earlier point with new understanding, not as "as I said before" but as "let me look at this again."

---

### Pattern 9: Becoming less certain
**Observation:** Thinking becomes less certain as it develops, not more. Uncertainty increases with understanding.

**Evidence:**
- `hs-authorship-evolution`: moves from "I have a problem" to "I am not sure about these things myself" to "I do not always have the answers"
- `hs-it-depends-human-system`: ends with compression ("Because it depends") after expanding variables

**Confidence:** high

**Use in generation:** Allow uncertainty to increase as the thought develops. Do not force resolution merely because the section ends.

---

### Pattern 10: Compressing a long chain into a short formulation
**Observation:** After long exploration, compresses into very short statement. The compression carries the weight of the exploration.

**Evidence:**
- `hs-it-depends-human-system`: "Because it depends." (3 words after long list of factors)
- `hs-it-depends-human-system`: "People and their feelings and reactions are also infra" (8 words compressing the Human System definition)
- `agent-2026-08-26-landed`: "I think we have landed this now"

**Confidence:** high

**Use in generation:** After exploration, allow compression. The short statement should feel earned, not inserted.

---

### Pattern 11: Leaving some things unresolved
**Observation:** Does not force closure. Allows questions to remain open, tensions to persist.

**Evidence:**
- `hs-authorship-evolution`: ends with "I do not always have the answers"
- `hs-it-depends-human-system`: does not resolve "what it depends upon" operationally
- Multiple trails end with questions or provisional statements

**Confidence:** high

**Use in generation:** For substantial writing, allow the ending to be unresolved where the thinking is unresolved. Do not manufacture closure.

---

### Pattern 12: Expanding scope mid-thought
**Observation:** Thinking widens from specific problem to broader principle, then to surrounding implications.

**Evidence:**
- `mb-state-locking-time`: starts with match locking → extends to squad assignment → extends to backfill logic → extends to "surrounding docs and principles"
- `hs-it-depends-human-system`: starts with "It depends" → expands to decision factors → expands to Human System definition → compresses to "infra"

**Confidence:** high

**Use in generation:** Allow the thought to widen. Start specific, then ask: what broader principle is this an instance of? What else must move with this change?

---

### Pattern 13: Noticing pattern across domains
**Observation:** Recognizes same pattern appearing in different contexts (match locking, squad assignment, backfill).

**Evidence:**
- `mb-state-locking-time`: "Same with Events and 'drafts', locking players etc."
- `mb-state-locking-time`: extends time-based state from matches to events to squads

**Confidence:** high

**Use in generation:** Ask: where else have I seen this? Is this a local problem or an instance of a broader pattern?

---

## Movement sequences (typical orderings)

### Sequence A: Irritation → Question → Simplification → Exception → Retain flexibility
**Observed in:** `mb-state-locking-time`
1. Notice excessive "locking" controls
2. Question: "do we really need all of these?"
3. Propose: time as implicit state
4. Exception: post-match correction must remain open
5. Principle: retain flexibility for informal reality

**Use:** When simplifying a system or process.

---

### Sequence B: Problem → Uncertainty → Corpus/depth request → Iteration
**Observed in:** `hs-authorship-evolution`
1. "I have a problem with the way the agent is writing"
2. "I am not sure about these things myself"
3. Request: "land a language, way of writing and feeling that reflects what I think"
4. Iterate: reject clean → reject processed → accept corpus-backed → request depth

**Use:** When developing authorship or voice.

---

### Sequence C: Plain statement → Variable expansion → Compression
**Observed in:** `hs-it-depends-human-system`
1. "Everyone hates when a consultant says this, but I actually love it"
2. Expand: list of 10+ factors it depends on
3. Compress: "Because it depends."

**Use:** For conceptual papers where the core insight is simple but the variables are many.

---

## What this model does NOT prescribe

- **Required sequence:** These are observed patterns, not a template. Do not force every paper through all 13 patterns.
- **Mandatory unresolved ending:** Unresolved endings appear when thinking is unresolved. Do not leave things open merely to satisfy this model.
- **Compression quota:** Not every section needs a short punchline. Compression appears after exploration, not as decoration.
- **Domain copying:** Do not copy the Matchboard domain examples into Human System papers. Use the movement pattern, not the content.

---

## Confidence summary

| Pattern | Confidence | Domain variation |
|---------|------------|------------------|
| Concrete irritation start | high | consistent across domains |
| Questioning default | high | consistent |
| Simpler model via subtraction | high | consistent |
| Counterexample/boundary | high | consistent |
| Adding another actor | high | human-system, matchboard |
| Adding time horizon | high | consistent |
| Informal vs. formal | high | human-system strongest |
| Return/revisit | moderate | observed but less frequent |
| Becoming less certain | high | reflective/argumentative |
| Compression after exploration | high | consistent |
| Unresolved ending | high | consistent |
| Scope expansion | high | consistent |
| Cross-domain pattern recognition | high | matchboard, human-system |

---

## Surface notes

### Reflective / conceptual (Human System papers)
- Patterns 1, 2, 3, 7, 9, 10, 11 most prominent
- Uncertainty increases through the piece
- Compression at key moments
- Informal/formal gap is central

### Technical reasoning (Matchboard decisions)
- Patterns 1, 2, 3, 4, 6, 12, 13 most prominent
- Simplicity via removal
- Exception handling retained
- Cross-domain pattern recognition

### Argumentative / correction
- Patterns 1, 2, 3 most prominent
- Direct challenge to existing approach
- Rapid compression

### Explanatory
- Patterns 5, 6, 12 most prominent
- Adding actors and time horizons
- Scope expansion

---

## Held-out for evaluation

The following trails should **not** be used for profile compilation. Reserve for held-out evaluation:

- `mb-cross-team-collaboration` (matchboard domain)
- `coach-interest-belonging` (coaching domain)

These will be used to test whether profile-guided generation exhibits similar thought movements without having seen these specific trails during compilation.

---

## Update protocol

When new thought-trail evidence is added:

1. Assess which domain(s) and surface(s) it belongs to
2. Compare against existing movement patterns
3. Strengthen, weaken, or contradict existing patterns as warranted
4. Update confidence levels
5. Add new patterns if observed behaviour is not captured
6. Retain uncertainty where evidence is mixed

Do not assume every new trail confirms the model. A new trail may reveal that an observed movement is domain-specific rather than general.

---

**Do not load raw thought trails for normal generation.** Load this model for substantial writing instead.

**For short/operational surfaces** (UI copy, metadata, procedures, reference docs), this model may be skipped. Use only the language model and surface profile.

---

## Relationship to LANGUAGE_MODEL.md

- `LANGUAGE_MODEL.md`: **how** the author uses language (sentence construction, vocabulary, punctuation)
- `THOUGHT_MOVEMENT_MODEL.md`: **how** the author's thinking develops (movement patterns, sequences, deepening behaviours)

Both should be loaded for substantial writing. Only `LANGUAGE_MODEL.md` is needed for short surfaces.
