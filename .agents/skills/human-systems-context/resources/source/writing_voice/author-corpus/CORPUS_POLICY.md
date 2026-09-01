# Author Corpus Policy

## Purpose

This corpus gives writing agents direct evidence of the author's language. It exists because abstract voice rules are not enough and can themselves create another generated style.

The corpus is evidence, not a phrase library and not a style template.

## Provenance classes

Use these classes:

1. `author-original` — known author-written material with no generative rewriting. Highest-value evidence.
2. `direct-user-message` — text directly written by the author in a chat, note, issue, comment, or similar source. Primary evidence, but do not claim it was composed without any prior influence unless known.
3. `author-approved-assisted` — AI-assisted text explicitly approved by the author as sounding like them. Secondary evidence only.
4. `rejected-ai` — generated prose the author rejects, plus the author's reaction/reason. Negative evidence.
5. `unknown` — unclear provenance. Do not use as primary voice evidence.

Never silently upgrade provenance.

## Raw means raw

Do not improve spelling, grammar, punctuation, capitalization, repetition, clause order, or sentence structure in `raw/`.

Those apparent defects may carry voice evidence.

Privacy/confidentiality redaction is the exception. Replace only the sensitive span with `[redacted:<kind>]` and record the redaction in metadata.

## Selection

Prefer stretches where the author is doing real cognitive work:

- trying to understand something;
- making a design decision;
- disagreeing;
- changing a view;
- qualifying a claim;
- connecting multiple variables;
- expressing uncertainty;
- explaining a trade-off;
- reacting emotionally;
- correcting generated prose;
- compressing a complicated idea into ordinary language.

Do not curate only polished or memorable lines. Connective prose matters.

## Public-repo safety

Before committing new corpus material to a public repository:

- remove client-identifying information;
- remove personal information about third parties;
- remove secrets, credentials, internal URLs, IDs, or confidential operational details;
- keep syntactic shape where possible;
- record redactions.

A voice corpus is not a reason to publish private history.

## Retrieval

### Normal generation (reader-facing prose)

For normal reader-facing generation (papers, essays, notes, web pages):

1. identify the surface and cognitive mode;
2. **load compiled representations** from `compiled/`:
   - `LANGUAGE_MODEL.md` (always)
   - `THOUGHT_MOVEMENT_MODEL.md` (for substantial writing)
   - `CONTRASTIVE_MODEL.md` (always)
   - relevant surface profile from `compiled/surfaces/`
3. prefer a current author-authored seed for the new piece;
4. draft from that seed, the compiled models, and the conceptual material;
5. compare the draft against `CONTRASTIVE_MODEL.md` before polishing;
6. check for historical-overlap before returning.

Do not copy signature phrases to manufacture resemblance.

### Analysis mode (corpus compilation, evaluation, research)

For corpus analysis, profile compilation, evaluation, or explicit author-language research:

1. raw corpus and thought trails may be read directly;
2. compare generated text against raw corpus for overlap detection;
3. update compiled profiles where warranted.

Do not use analysis mode for normal generation.

### Exception — current author seed

If the author provides a direct seed for the current artifact (e.g., "People and their feelings and reactions are also infra" for a new paper), that seed may remain available verbatim. Do not paraphrase it merely to avoid overlap.

The rule is: historical corpus language should not leak into new prose merely because it was retrieved. A current artifact seed is different.

## Growth

Do not silently harvest every conversation.

New additions should be deliberate, with provenance.

When the author rejects generated prose, preserve representative negative evidence where useful.

When the author identifies something as genuinely representative, prefer adding the full surrounding passage rather than only the quotable line.
