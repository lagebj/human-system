# EDITING_CHARTER

## Purpose

This charter defines **how editing decisions are made** during the current phase of work.

Its role is to:
- prevent machine-pattern drift
- preserve spoken, human thinking
- externalize memory so context is not lost across sessions

If a proposed change violates this charter, it is rejected — even if it reads “better”.

---

## Scope

This charter governs all editorial work on `human.md` during the de-patterning and spoken-thinking phases.

It does **not** replace the Writing Working Agreement.
If the two conflict, the Writing Working Agreement wins.

---

## Core Rules (Binding)

0. **Manuscript Purity Rule**
   Editorial metadata, pass completion notes, summary tables, pattern analysis, and process documentation must NEVER appear in manuscript files. Manuscript files contain ONLY the walking text (title, subtitle, section separators, and numbered paragraphs). Editorial state is tracked separately in `docs/working-session.md` and pass-specific logs.

1. **Break symmetry aggressively**
   Repeating paragraph shapes, sentence mechanics, or rhythmic patterns are actively harmful and must be disrupted.

2. **Repetition by structure is worse than repetition by idea**
   The same sentence move or paragraph arc repeated twice is unacceptable, even if the wording differs.

3. **Circling is allowed only if something changes**
   A revisited idea must introduce a new angle, cost, actor, time horizon, or consequence. Otherwise, it is repetition and must be cut or merged.

4. Paragraph Merging (Binding)
    - Merging paragraphs is a **primary editing move**, not an exception.
    - If two or more adjacent paragraphs carry the same thought movement, they should be merged.
    - Repetition across paragraphs is a signal of **over-segmentation**, not of emphasis.
    - Paragraph boundaries must reflect a real change in footing, angle, or momentum — not readability, pacing, or visual balance.
    - When in doubt between refining or merging, **merge first**.
    - Longer, uneven paragraphs are preferred over multiple smaller ones carrying the same movement.

5. **Spoken thinking overrides written clarity**
   If clarity requires smoothing, ordering, or resolving thought prematurely, clarity loses.

6. **Paragraphs may end unresolved**
   Do not force closure. Momentum matters more than completion.

7. **Do not normalize backwards**
   Once a paragraph range has passed a de-patterning pass, later text must adapt to it. Earlier text is not retrofitted for consistency.

8. **Avoid tidy landings**
   Paragraphs that neatly summarize or balance themselves should be shortened, disrupted, or cut earlier.

9. **Variation is mandatory**
   Adjacent paragraphs must not feel mechanically related. If they do, at least one must change shape.

10. **Phrase reuse is restricted**
   Phrases, sentence openings, or framing moves that recur are to be treated as suspect and removed or radically reworked.

11. **Editing is pass-based, never mixed**
    Each session performs exactly one pass:
    - Pass A: De-patterning (break form, remove repetition)
    - Pass B: Spoken-thinking (restore human flow selectively)

12. **The text does not argue for itself**
    Familiarity, elegance, or “this sounds good” are not valid defenses against cuts or disruption.

13. **Constraints accumulate**
    Once a pattern is identified and removed, it becomes illegal everywhere else in the manuscript.

14. **Ledger updates are mandatory**
    Every editing pass must conclude with an explicit check of:
    - Pattern Ledger updates
    - Concept Return Log updates

    If no updates are required, this must be stated explicitly.
    An editing pass is incomplete without this confirmation.

---

## Paragraph Norms (Observed Practice)

These norms describe how reflective, essayistic nonfiction in this genre typically behaves “in the wild”.
They are descriptive constraints, not stylistic tricks.

- Paragraphs represent **continuous thought breaths**, not ideas or arguments.
- Paragraphs end when the thinking runs out of momentum, not when balance or symmetry is achieved.
- **Medium-to-long paragraphs are the default** and should not be broken for visual or rhythmic reasons.
- Short paragraphs are exceptional and should appear only when the thinking genuinely collapses into brevity.
- Entire-chapter paragraphs are rare and deliberate; they are not a default form.
- Paragraph length and shape must follow thinking, not design, cadence, or pattern.
- Unevenness is normal. Visual neatness is not a goal.

If a paragraph break exists primarily to “improve readability” rather than to reflect a change in thought movement, it is suspect.

---

## Enforcement

- This charter must be in scope (pasted or referenced) at the start of every editing session.
- Violations must be corrected immediately when detected.
- If unsure, prefer roughness over polish.

---

## Completion Criteria (Mandatory)

An editing pass is considered complete only if it produces:

1. Explicit paragraph-level actions within the declared scope
2. An explicit Ledger Check covering:
   - Pattern Ledger
   - Concept Return Log
3. A copy-paste-ready CHANGELOG entry

If any of these are missing, the pass is invalid and must be corrected before proceeding.

---

## Mandatory Editor Check

After each paragraph:
"Did this paragraph get easier, or did it get fuller?"

If the answer is "easier", the paragraph must be expanded.

## Exit Condition

This charter remains active until:
- de-patterning is complete across the manuscript
- spoken-thinking passes are complete
- chapter seams are ready to be discovered

Only then may a different charter replace this one.

## Editing Passes

This book is edited through explicitly defined **passes**. Each pass has a single responsibility. Passes are not blended. When a pass is active, all other concerns are subordinate to that pass.

The passes exist to remove ambiguity about *what kind of work is being done* at any given moment.

### Pass A — De-patterning (Structural Refactoring)

#### Pass A Invariants (Hard Constraints)

- Pass A MUST NOT reduce overall length.
- Pass A SHOULD slightly increase length in most cases.
- If a pattern removal results in shorter text, the editor must compensate immediately.

**Purpose**

* Remove repeated linguistic, rhetorical, and structural patterns that flatten thought.
* Refactor prefab shapes into heavier, causal forms **without reducing content mass**.

**What Pass A does**

* Detects repetition in phrasing, paragraph arcs, transitions, and cadence.
* Refactors patterns by **expansion and causal embedding**, not deletion.
* Enforces the Pattern Ledger as binding law.
* Preserves or increases paragraph load and conceptual density.

**What Pass A explicitly does *not* do**

* It does not optimize for clarity, readability, or elegance.
* It does not shorten text for conciseness.
* It does not resolve arguments or improve narrative flow beyond removing pattern interference.

**Success criteria**

* The text is heavier, not cleaner.
* Paragraphs carry full thought-breaths.
* Language and structure vary visibly.
* No repeated prefab shapes remain.

#### Definition of Pass A Failure

Pass A is considered failed if:
- Paragraphs become cleaner but thinner
- The text reads faster than before
- The chapter could plausibly be reduced to a summary without discomfort

---

### Pass B — Causal Tightening (Internal Coherence)

**Purpose**

* Tighten cause-and-effect relationships inside and across paragraphs.
* Ensure that movements introduced in earlier sections continue to act downstream.

**What Pass B does**

* Strengthens causal chains without introducing new ideas.
* Removes accidental ambiguity that was *not* intentionally preserved.
* Aligns transitions so movement feels continuous rather than episodic.

**What Pass B does *not* do**

* It does not introduce stylistic variation for its own sake.
* It does not reintroduce banned patterns removed in Pass A.

---

### Pass C — Language & Load Balancing

**Purpose**

* Balance sentence length, paragraph density, and reading effort.
* Ensure variation without drift or rhetorical signaling.

**What Pass C does**

* Rebalances overly dense or overly sparse sections.
* Adjusts sentence rhythm while preserving causal structure.
* Ensures short paragraphs are intentional and rare.

**What Pass C does *not* do**

* It does not simplify concepts.
* It does not reframe arguments.

---

### Pass D — Continuity & Concept Return

**Purpose**

* Ensure concepts reappear with accumulated meaning rather than repetition.
* Maintain continuity across chapters and long stretches.

**What Pass D does**

* Aligns with the Concept Return Log.
* Prevents reintroduction of ideas as if new.
* Ensures later sections carry the weight of earlier movement.

---

### Pass E — Final Read Integrity

**Purpose**

* Perform a final integrity check before locking a chapter or manuscript.

**What Pass E does**

* Checks for accidental pattern reintroduction.
* Ensures no pass-specific violations remain.
* Confirms that the text still thinks the way the charter intends.

**What Pass E does *not* do**

* It does not materially change content unless a violation is found.

---

## Pass Discipline

* Only one pass may be active at a time.
* All feedback, critique, and changes must be scoped to the declared pass.
* If a different concern is discovered, it is logged and deferred to the appropriate pass.

This discipline is non-negotiable. It exists to protect the thinking on the page.
