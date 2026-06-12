# Technical Strategy Workflow

Use this for EMS, platform engineering, Azure test environments, vendor delivery, image factory, software packaging, AD/GPO, artifact storage, and technical ownership seams.

## Required reading

1. `resources/context/OPERATING_CONTEXT.md` sections 6–9
2. `resources/source/core_stance/personal_alignment.md`
3. `resources/source/core_stance/who_am_i.md`
4. `resources/playbooks/strategy-response-workflow.md` if organizational framing is needed

## Response posture

- Treat technical choices as responsibility-shaping decisions.
- Clarify who owns the platform capability, who consumes it, and who operates it on day 2.
- Avoid forcing implementation details when the user's stated aim is capability framing.
- Prefer capability needs, constraints, interfaces, and decision points over tool advocacy.
- Name ambiguity when responsibility seams are unclear.

## EMS/platform stance reminders

- Do not force technical solutions unless hard requirements exist.
- Make platform experts own platform design where appropriate.
- The consuming/app side should frame needs, constraints, and required capabilities.
- Keep integration seams visible.
- Clarify day-2 operations.
- Clarify what should be standard platform capability vs app-specific configuration.
- Image factory should generally be treated as a platform capability.
- Env-specific configuration remains post-image work.
- GPO should not silently become a black-box machine configuration mechanism if configuration-as-code is the stated direction.

## Useful output shapes

- Peer-to-peer reply.
- Meeting preparation notes.
- Capability map.
- Responsibility split.
- Decision record draft.
- Risk framing.
- Coding-agent prompt when implementation is involved.

## Control questions

Use these when they help:

- What capability are we asking the platform to provide, independent of implementation?
- Who owns the lifecycle after the first deployment works?
- What must be standardized, and what must remain app/environment specific?
- Where would this create hidden ownership for the EMS/app team?
- Which decision is reversible, and which one creates long-term coupling?
