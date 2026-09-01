# Surface Profile: Explanatory

**Version:** 1.0  
**Compiled:** 2026-09-01  
**Evidence base:** 2 explanatory samples + general technical samples with explanatory elements  
**Provenance:** `direct-user-message`

---

## Purpose

This profile describes author language behaviour specific to **explanatory** surfaces (explaining concepts, answering inquiries, describing how something works). Use this in addition to the base `LANGUAGE_MODEL.md`.

---

## Strongly supported observations (this surface)

### 1. Questions as inquiry, not challenge
**Observation:** Questions seek understanding, not to challenge assumptions.

**Evidence:**
- `music-2026-08-21-vocal-bleed`: "What about vocal bleed in drums mics?" (follow-up inquiry)
- `general-2026-08-14-rpc`: "is there any possibilities given my Tech stack to use similar model?"
- `general-2026-08-14-rpc`: "Is there potentially any value to it in Matchboard context?"

**Confidence:** high

### 2. Moderate sentence length
**Observation:** Sentences are moderate in length — not as long as reflective, not as compressed as argumentative.

**Evidence:**
- `mb-2026-08-27-docs-value`: explanatory passages are 20-40 words on average
- `general-2026-08-17-public-urls`: direct inquiry, ~25 words

**Confidence:** moderate

### 3. Technical and ordinary mix
**Observation:** Mixes technical terms with ordinary language for clarity.

**Evidence:**
- `mb-2026-08-27-docs-value`: explains product value in accessible terms
- `general-2026-08-14-rpc`: "This is a fascinating concept" (ordinary) + technical stack inquiry

**Confidence:** moderate

### 4. Openness to possibilities
**Observation:** Shows openness to new ideas without committing.

**Evidence:**
- `general-2026-08-14-rpc`: "This is a fascinating concept, is there any possibilities..."
- `mb-2026-08-27-demo-data`: "This is an opportunity to have some fun and be creative IMO"

**Confidence:** high

### 5. Context-setting before detail
**Observation:** Provides context before diving into specifics.

**Evidence:**
- `music-2026-08-21-live-vocals`: sets up the full recording context before asking the question
- `general-2026-08-14-rpc`: links to source, then asks about applicability

**Confidence:** moderate

### 6. Collaborative tone
**Observation:** Explanatory surface often invites collaboration or input.

**Evidence:**
- `mb-2026-08-29-situational-flows`: "What do the internet say about decision-/situation-driven flows like this?"
- `mb-2026-08-29-situational-flows`: "Inspiration does not need to be from a similar app or domain, but"

**Confidence:** moderate

---

## Shared with other surfaces

These behaviours appear across multiple surfaces:

- Simple connectives
- First-person stance
- Technical shorthand when appropriate
- Questions in reasoning
- Ordinary vocabulary

---

## Things not yet known (this surface)

- How explanatory writing differs between technical and non-technical topics
- Whether the author uses examples/metaphors more in explanatory mode
- How uncertainty is handled when explaining something the author is not expert in
- Whether explanatory writing shows more or less humour than other surfaces

**Confidence:** low

---

## Generation guidance (this surface)

### Do
- Use questions as genuine inquiry
- Mix technical and ordinary language for clarity
- Provide context before details
- Show openness to possibilities without over-committing
- Invite collaboration where appropriate
- Keep sentences moderate in length

### Do not
- Over-explain when the audience is technical
- Under-explain when the audience is non-technical
- Use challenge questions (save for argumentative surface)
- Force humour where it does not arise naturally
- Make explanatory passages into mini-essays (keep focused)

---

## Relationship to thought movement (this surface)

For substantial explanatory writing, load `THOUGHT_MOVEMENT_MODEL.md` and prioritize:

- Pattern 5: Adding another actor or perspective
- Pattern 6: Adding another time horizon
- Pattern 12: Expanding scope mid-thought

Explanatory surfaces may not require full depth exploration. Use judgment based on complexity.

---

## Held-out samples (this surface)

(None reserved — small evidence base)

---

## Update protocol

When new explanatory evidence is added:

1. Compare against existing observations
2. Strengthen, weaken, or contradict as warranted
3. Update confidence levels
4. Add new observations if behaviour is not captured
5. Retain uncertainty where evidence is mixed

---

## Evidence limitations

This profile is based on only 2 dedicated explanatory samples, with supplementary evidence from technical samples that contain explanatory elements. Confidence is lower than for reflective and technical surfaces. Treat observations as provisional until more evidence is available.
