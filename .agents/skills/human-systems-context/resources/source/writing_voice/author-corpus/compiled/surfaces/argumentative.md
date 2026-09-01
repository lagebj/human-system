# Surface Profile: Argumentative / Correction

**Version:** 1.0  
**Compiled:** 2026-09-01  
**Evidence base:** 3 argumentative samples  
**Provenance:** `direct-user-message`

---

## Purpose

This profile describes author language behaviour specific to **argumentative / correction** surfaces (disagreement, boundary-setting, decision closeout, rejecting suggestions). Use this in addition to the base `LANGUAGE_MODEL.md`.

---

## Strongly supported observations (this surface)

### 1. Direct imperatives
**Observation:** Uses imperative form for corrections: "Do not use...", "Ensure that...", "Rewrite..."

**Evidence:**
- `mb-2026-08-29-english`: "Do not use 'hospitering' or 'hospitant' if this is not valid english"
- `mb-2026-08-29-english`: "ensure that we are not introducing sporadic norwegian language now that we are english-only"
- `mb-2026-08-29-english`: "rewrite the prompt so this is not silently introduced"

**Confidence:** high

### 2. Short compression
**Observation:** After stating the problem, compresses into short directive.

**Evidence:**
- `agent-2026-08-18-subfolder`: "I need a subfolder in .matchboard-work, I have multiple programmes here" (24 words, 2 clauses)
- `agent-2026-08-26-landed`: "I think we have landed this now" (7 words)

**Confidence:** moderate

### 3. Challenge questions
**Observation:** Questions that challenge assumptions or push back, not just seek information.

**Evidence:**
- `mb-2026-08-29-english`: "Do not use... if this is not valid english" (implicit challenge)
- `mb-2026-08-30-finalisation`: "do we really need all of these?"

**Confidence:** high

### 4. Less qualification, more certainty
**Observation:** Compared to reflective surface, shows less hedging and more direct certainty.

**Evidence:**
- `mb-2026-08-29-english`: no hedging, direct correction
- `agent-2026-08-18-subfolder`: "I need" (direct statement of need)

**Confidence:** moderate

### 5. Boundary-setting language
**Observation:** Establishes boundaries clearly: "if this is not...", "ensure that we are not..."

**Evidence:**
- `mb-2026-08-29-english`: full passage is boundary-setting

**Confidence:** high

### 6. Decision closeout
**Observation:** Signals completion decisively when ready.

**Evidence:**
- `agent-2026-08-26-landed`: "I think we have landed this now, if you agree give me the bundle, if not clarify where we need decisions"

**Confidence:** high

### 7. Conditionals for flexibility
**Observation:** Uses conditionals to allow for correction: "if you agree", "if not clarify"

**Evidence:**
- `agent-2026-08-26-landed`: "if you agree give me the bundle, if not clarify"

**Confidence:** high

---

## Shared with other surfaces

These behaviours appear across multiple surfaces:

- Simple connectives
- Direct correction (but stronger here)
- First-person ownership
- Technical shorthand when relevant

---

## Things not yet known (this surface)

- How the author handles sustained disagreement over multiple exchanges
- Whether humour appears in argumentative contexts (likely reduced)
- How argumentative writing differs between technical correction and conceptual disagreement
- Whether the author softens corrections for different audiences (team vs. agent vs. public)

**Confidence:** low

---

## Generation guidance (this surface)

### Do
- Use direct imperatives for corrections
- Compress after stating the problem
- Ask challenge questions (not just information-seeking)
- Set boundaries clearly with conditionals
- Signal closeout decisively when ready
- Allow for correction ("if you agree", "if not clarify")

### Do not
- Over-qualify or hedge excessively
- Soften corrections unnecessarily
- Hide behind passive voice
- Assume the correction is final (allow for pushback)
- Add unnecessary explanation when the directive is clear

---

## Relationship to thought movement (this surface)

For substantial argumentative writing, load `THOUGHT_MOVEMENT_MODEL.md` and prioritize:

- Pattern 1: Starting from concrete irritation
- Pattern 2: Questioning the default mechanism
- Pattern 3: Proposing a simpler model

Argumentative surfaces may not require full depth exploration. Use judgment based on stakes.

---

## Held-out samples (this surface)

(None reserved — small evidence base)

---

## Update protocol

When new argumentative evidence is added:

1. Compare against existing observations
2. Strengthen, weaken, or contradict as warranted
3. Update confidence levels
4. Add new observations if behaviour is not captured
5. Retain uncertainty where evidence is mixed

---

## Evidence limitations

This profile is based on only 3 samples. Confidence is lower than for reflective and technical surfaces. Treat observations as provisional until more evidence is available.
