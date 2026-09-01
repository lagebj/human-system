---
name: public-writing
description: Author and revise reader-facing Human System prose — papers, essays, notes, web pages, conceptual pieces. Preserves epistemic status, distinguishes conceptual content from agent scaffolding, and applies the public-language authorship model. Does not load manuscript-only constraints.
---

# Public Writing

This skill governs how Human System thinking is represented to readers in public material. It is the common layer for reader-facing artifact development. Paper development is the paper-specific layer built on top of this.

Load `human-systems-context` first for conceptual stance. Use this skill for:

- working papers
- essays
- public notes
- web pages
- conceptual pages
- research-backed pieces
- public descriptions of patterns

## Core responsibilities

1. **Load the public-language principles** from `resources/source/writing_voice/public-language.md`
2. **Load relevant Human System conceptual context** for the subject matter
3. **For normal reader-facing generation**: load compiled author representations from `resources/source/writing_voice/author-corpus/compiled/` instead of retrieving raw corpus samples:
   - `LANGUAGE_MODEL.md` (always)
   - `THOUGHT_MOVEMENT_MODEL.md` (for substantial writing: papers, essays, long-form pages)
   - `CONTRASTIVE_MODEL.md` (always)
   - Relevant surface profile from `compiled/surfaces/` (reflective, technical, argumentative, explanatory)
4. **Exception — current author seed**: If the artifact begins from a direct author-written seed for this specific work, that seed may remain available verbatim. Do not paraphrase it merely to avoid overlap.
5. **Raw corpus access modes**:
   - `analysis`: May read raw corpus and thought trails (used for compiling profiles, updating observations, evaluating drift, corpus research)
   - `generation`: Must normally not read historical raw fragments (used for essays, papers, pages, reader-facing prose)
   - `evaluation`: May compare generated text against raw corpus (used for overlap detection, stylistic diagnostics, held-out comparison)
6. **Preserve epistemic status** — do not manufacture certainty or resolve uncertainty that exists in the source
7. **Distinguish conceptual content from agent scaffolding** — public material may expose provisional thinking, but not task routing, source-loading instructions, validation implementation details, agent-specific comments, editorial metadata, or internal status bookkeeping
8. **Author reader-facing prose** — create a representation of the thinking, not a serialization of the agent's internal object model. Apply compiled language behaviour to genuinely new thought. For substantial work, add private pre-draft depth exploration using `THOUGHT_MOVEMENT_MODEL.md` (what sits underneath, what complicates, what examples change it, what another actor sees, what boundary conditions appear, what remains unresolved)
9. **Run a final human-language review** using the public-language integrity check and `CONTRASTIVE_MODEL.md`. For substantial work, also check: did the thought change, was context sufficient without chat history, is length excavation/movement or padding, did depth make voice generic, is unresolved ending earned or merely underdeveloped
10. **Check for historical-overlap** — before returning reader-facing prose, verify that distinctive historical corpus sequences have not leaked into generation. See Part XII below.
11. **Route to research/citation/reader-test capabilities** when their triggers apply

## Do not

- load manuscript-only constraints (Writing Working Agreement, Editing Charter, Pattern Ledger, manuscript voice guide)
- turn provisional thought into polished framework or methodology
- manufacture confidence because confident prose sounds more finished
- mechanically hedge every sentence
- convert everything into advice or prescription
- automatically close with conclusions, recommendations, or summaries
- expose agent scaffolding in reader-facing prose
- optimise for content-marketing cadence or SEO
- impose structural templates (every page needs the same skeleton)
- retrieve historical raw corpus fragments into normal generation context
- copy phrases, sentences, or distinctive wording from historical corpus into new prose
- treat the compiled models as rigid rules (they are observed behaviours with confidence levels)
- create a "Lage score" or voice classifier (no numeric authorship thresholds)

## Epistemic calibration

The writing should naturally distinguish among:

- what I have directly experienced
- what I have observed repeatedly
- what I currently believe
- what seems plausible
- what I suspect
- what research supports
- what I do not know
- what appears contradictory
- what depends heavily on context

First-person language is valid: "I think", "I keep seeing", "What I have noticed", "I am less certain about", "I don't know yet", "I suspect".

A piece may end with an unresolved question. A page may describe a tension without resolving it.

## Workflow

1. **Identify the artifact type** — paper, essay, note, web page, conceptual piece
2. **Load the relevant conceptual sources** — what thinking does this draw from?
3. **Load public-language.md** — apply the authorship model
4. **Author the prose** — create reader-facing representation from the ideas
5. **Preserve uncertainty** — where the source is provisional, the public text should be too
6. **Strip scaffolding** — remove agent instructions, routing references, validation notes, editorial metadata
7. **Final review** — run the public-language integrity check
8. **Conditional capabilities:**
   - `research-pressure-test` + `research` — when load-bearing claims need testing
   - `grounded-citations` — when external evidence is being used
   - `reader-test` — when the draft is independently readable
   - `publication-review` — when preparing for publication (class 6)

## Public/private boundary

Public material may deliberately expose:

- thinking patterns
- hypotheses
- models
- unresolved tensions
- conceptual diagrams
- field observations
- uncertainty
- arguments under development
- questions with no current answer
- changes of mind
- contradictions worth examining

Block accidental exposure of:

- private client information
- personal data
- secrets
- internal agent scaffolding (task routing, skill-loading, prompt fragments, validation details, agent-specific comments, editorial scratch notes, publication-readiness mechanics, internal status bookkeeping, hidden reasoning scaffolds, temporary decomposition created only to help an agent write)
- unpublished artifacts the human did not choose to expose
- manuscript content not selected for publication
- references to `AGENTS.md`, `SKILL.md`, `.agents/`, workflow JSON, reader-test procedures, or internal linting unless the page is intentionally about those mechanisms

**Principle:** Public material is a representation of the thinking, not a serialization of the agent's internal object model.

## Final integrity check

Before returning public prose, verify:

- Does this sound like a person exploring a view or an organisation declaring policy?
- Which statements did I read as established facts? Were they meant as such?
- Where did the writer appear more certain than the evidence justified?
- Where did I feel the text had been organised for me rather than thought through with me?
- Did any list or heading structure feel mechanical?
- What appears unresolved? Does it feel intentional or merely incomplete?
- What do I think the author's own position is?
- Did any humour or sarcasm alter how I interpreted the author's stance?
- Does any agent scaffolding remain visible?
- Has editing made this more certain than the thinking actually is?
- Has editing made this more orderly than the thinking actually is?
- Has editing made the author emotionally neutral where the underlying thought is not?
- Can I still feel someone thinking here?
- Did a useful hesitation get converted into a clean conclusion?
- Did the text resolve a tension merely because the section ended?
- Did I turn connected reasoning into a list?
- Did I turn uncertainty into repetitive hedging?
- Did humour arise naturally, or was it inserted to satisfy a voice instruction?
- Is sarcasm aimed at an absurd condition or at a person?
- Is contrast carrying a real observation or merely manufacturing a punchline?
- Has the author disappeared behind institutional language?
- Is this passage clearer because the thought became clearer, or merely cleaner because the prose was normalized?
- Has the page become so polished that it no longer feels lived?

## Relationship to paper-development

`paper-development` is the specialization for narrow papers that test one question. It uses this skill for the prose layer and adds:

- claim location and confidence
- pressure-testing of load-bearing claims
- evidence registration with `grounded-citations`
- reader-testing for independent readability

Use `paper-development` for class 4 (Paper Development) tasks. Use this skill directly for other reader-facing work (class 2 concept development that becomes public, class 6 publication preparation, or ad hoc public notes).

## Historical-overlap detection

Before returning reader-facing prose, check for suspicious reuse of historical corpus wording. This protects against the failure mode where generation copies old phrases rather than learning language behaviour.

### Detection heuristics

Check for:

- Exact n-gram overlap above meaningful length (11+ words)
- Highly distinctive sentence overlap
- Unusually long matching word sequences
- Near-identical sentences if tooling supports them

### Do NOT flag

- Common phrases: "I think", "it depends", "I am not sure"
- Technical terms and project terminology
- Ordinary language sequences
- Current-seed language (if the author provided this seed for this artifact, it is legitimate)

### Response to detected overlap

1. Identify the underlying thought
2. Identify which historical fragment contaminated generation (if any)
3. Remove that fragment from generation context if it was incorrectly loaded
4. Regenerate or re-author the affected passage from the compiled profile
5. Preserve current-seed language if the overlap is legitimate

Do not automatically synonym-rewrite detected overlap. That would reintroduce artificial prose.

## Held-out evaluation

A small held-out set of author material is reserved for evaluation only (not used for compilation). Use this to test whether profile-guided generation resembles held-out author behaviour without having seen those specific samples during compilation.

Held-out samples:
- `coach-2026-08-31-belonging` (coaching surface)
- `mb-2026-08-29-collab-counter` (technical surface)
- `hs-2026-09-01-infra` (reflective surface)
- `mb-cross-team-collaboration` (matchboard thought trail)
- `coach-interest-belonging` (coaching thought trail)

## Relationship to publication-review

This skill authors and revises. `publication-review` assesses readiness for publication (class 6). Publication itself (class 7) requires explicit human intent.

Do not treat "looks ready" as permission to publish.
