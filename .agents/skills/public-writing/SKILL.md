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
3. **Retrieve relevant author corpus samples** from `resources/source/writing_voice/author-corpus/` for the cognitive surface (reflective, technical, argumentative, explanatory, coaching, meta)
4. **For substantial conceptual writing (papers, essays, long-form Human System pages)**: retrieve 2–4 relevant thought trails by topic and cognitive movement similarity, plus a long-form depth reference where appropriate
5. **Preserve epistemic status** — do not manufacture certainty or resolve uncertainty that exists in the source
6. **Distinguish conceptual content from agent scaffolding** — public material may expose provisional thinking, but not task routing, source-loading instructions, validation implementation details, agent-specific comments, editorial metadata, or internal status bookkeeping
7. **Author reader-facing prose** — create a representation of the thinking, not a serialization of the agent's internal object model. Prefer human-authored seed + corpus evidence over polished AI draft + style rewrite. For substantial work, add private pre-draft depth exploration (what sits underneath, what complicates, what examples change it, what another actor sees, what boundary conditions appear, what remains unresolved)
8. **Run a final human-language review** using the public-language integrity check, loading rejected-ai evidence when available. For substantial work, also check: did the thought change, was context sufficient without chat history, is length excavation/movement or padding, did depth make voice generic, is unresolved ending earned or merely underdeveloped
9. **Route to research/citation/reader-test capabilities** when their triggers apply

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

## Relationship to publication-review

This skill authors and revises. `publication-review` assesses readiness for publication (class 6). Publication itself (class 7) requires explicit human intent.

Do not treat "looks ready" as permission to publish.
