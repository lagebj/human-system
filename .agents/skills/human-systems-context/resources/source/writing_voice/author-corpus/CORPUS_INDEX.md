# Corpus Index

**Version:** 2.0 (compiled architecture)  
**Initial seed:** 38 direct user messages  
**Thought trails:** 8 sequences  
**Compiled:** 2026-09-01

---

## Architecture change (v2.0)

The corpus is now **evidence used to derive the model of the author's language**, not a phrase library for direct retrieval.

**Normal generation** loads compiled representations from `compiled/`:
- `LANGUAGE_MODEL.md` — observed linguistic behaviour
- `THOUGHT_MOVEMENT_MODEL.md` — cognitive movement patterns
- `CONTRASTIVE_MODEL.md` — author vs. default-generated contrasts
- `surfaces/*.md` — surface-specific profiles (reflective, technical, argumentative, explanatory)

**Raw corpus** (`raw/`, `thought-trails/`) is used for:
- Profile compilation and updates
- Evaluation and overlap detection
- Explicit author-language research

See `CORPUS_POLICY.md` for retrieval modes.

---

## Raw corpus by surface

### argumentative

- `mb-2026-08-29-english` — Language boundary
- `agent-2026-08-18-subfolder` — Correcting artifact structure
- `agent-2026-08-26-landed` — Decision closeout

### coaching

- `coach-2026-08-31-belonging` — Player development framing **[HELD-OUT]**
- `coach-2026-08-26-stronger-players` — Development challenge design

### explanatory

- `mb-2026-08-27-docs-value` — Explaining product value
- `general-2026-08-18-npm-pnpm` — Simple technical inquiry

### meta

- `hs-2026-09-01-clean` — Rejecting overly clean language
- `hs-2026-09-01-tension` — Emotional tension
- `hs-2026-09-01-ai-processed` — Rejecting processed prose
- `hs-2026-09-01-history` — Corpus expansion
- `agent-2026-09-01-rewrite-sequence` — Workflow sequencing
- `agent-2026-09-01-rewrite-failed` — Rejecting prior rewrite

### reflective

- `hs-2026-09-01-public-language-problem` — Human System public language
- `hs-2026-09-01-uncertainty` — Epistemic stance
- `hs-2026-09-01-background` — Background vs foreground
- `hs-2026-09-01-it-depends` — Meaning of It depends
- `hs-2026-09-01-human-system` — Meaning of Human System
- `hs-2026-09-01-infra` — Human infrastructure **[HELD-OUT]**

### technical

- `mb-2026-08-30-finalisation` — State model simplification
- `mb-2026-08-30-backfill` — Automatic backfill logic
- `mb-2026-08-30-programme-docs` — Implementation programme scope
- `mb-2026-08-30-kicks-weekly` — Product concept adaptation
- `mb-2026-08-29-situational-flows` — Situation-driven UX
- `mb-2026-08-29-spec-transfer` — Architecture/specification transfer
- `mb-2026-08-29-rego` — Feature gate decision
- `mb-2026-08-29-collab-invite` — Cross-group collaboration
- `mb-2026-08-29-collab-counter` — Specific-player request flow **[HELD-OUT]**
- `mb-2026-08-26-locking-time` — Time-based state transitions
- `mb-2026-08-26-postmatch-correction` — Late correction principle
- `mb-2026-08-26-existing-data` — Backfill/evidence constraints
- `mb-2026-08-26-multiselect` — Evidence model refinement
- `mb-2026-08-27-demo-data` — Demo-data tone
- `mb-2026-08-20-weekly-summary` — Weekly summary reasoning
- `music-2026-08-21-live-vocals` — Live vocal recording
- `music-2026-08-21-vocal-bleed` — Follow-up question
- `general-2026-08-17-public-urls` — Capability inquiry
- `general-2026-08-14-rpc` — Exploring unfamiliar concept

---

## Thought trails by domain

### human-system

- `hs-authorship-evolution.md` — Public writing, authorship, style rules → thought depth
- `hs-it-depends-human-system.md` — From "It depends" to Human System and human infrastructure

### matchboard

- `mb-state-locking-time.md` — From explicit finalisation to time/evidence as state
- `mb-situational-decision-support.md` — Situation-driven UX flows
- `mb-evidence-opponent-strength.md` — Opponent strength evidence model
- `mb-cross-team-collaboration.md` — Cross-team collaboration patterns **[HELD-OUT]**
- `mb-documentation-value.md` — Documentation value reasoning

### coaching

- `coach-interest-belonging.md` — Player interest and belonging **[HELD-OUT]**

---

## Compiled representations

### Core models

- `compiled/LANGUAGE_MODEL.md` — Observed linguistic behaviour (clause construction, qualification, repetition, vocabulary, questions, sentence/paragraph behaviour, emotional language, humour)
- `compiled/THOUGHT_MOVEMENT_MODEL.md` — Cognitive movement patterns (13 patterns, typical sequences)
- `compiled/CONTRASTIVE_MODEL.md` — Author tendencies vs. default-generated behaviour (12 contrasts)

### Surface profiles

- `compiled/surfaces/reflective.md` — Reflective/conceptual surface (Human System papers, essays)
- `compiled/surfaces/technical.md` — Technical reasoning surface (architecture, implementation)
- `compiled/surfaces/argumentative.md` — Argumentative/correction surface (disagreement, boundaries)
- `compiled/surfaces/explanatory.md` — Explanatory surface (concept explanation, inquiries)

### Evaluation

- `compiled/HELD_OUT_EVALUATION.md` — Held-out evaluation set and procedure

---

## Rejected-AI evidence

- `rejected/author-reactions.md` — Author reactions to generated language (too clean, too processed, core public-language problem, desired outcome)

---

## Unfinished thinking

- `unfinished/authorship-depth-open-question.md` — Records that depth does not require closure

---

## Samples index

- `samples.jsonl` — Structured index of all corpus samples with provenance, surface, and metadata

---

**Note:** Samples marked **[HELD-OUT]** are reserved for evaluation only. They must NOT be used for profile compilation.
