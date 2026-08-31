# Human Systems Context Skill

Use the `human-systems-context` skill whenever a task touches this body of
thought or the author's operating stance, including:

- understanding and intervening in human systems when the right action depends on
  context; "it depends, therefore identify what it depends upon"
- operating-model transformation, modernization in place, enablement, capability
  transfer, customer independence, responsibility seams, decision-making under
  uncertainty
- Agile, DevOps, Team Topologies, OKRs, process theatre, platform/team
  boundaries, governance, organizational learning
- platform / EMS / Azure ephemeral test environments, Terraform, Ansible,
  Packer/image factory, Artifactory, Vault, GitLab, vendor delivery, AD/GPO,
  Kafka, software packaging strategy
- writing that should preserve the author's voice and avoid generic consultancy
  language
- manuscript work for the book, only when the user explicitly asks for it

Default to English unless the user explicitly asks for another language.

Routing (see the skill's `SKILL.md` for the full task-class map):

- Concept / research / strategy work: `resources/source/core_stance/contextual-intervention.md`,
  then `resources/source/core_stance/`, then `resources/source/field_patterns/`
  when enablement or modernization is involved.
- Writing voice (general): `resources/source/writing_voice/public-language.md` for reader-facing material; `resources/source/writing_voice/manuscript-voice-guide.md` for manuscript work only.
- Manuscript work only: `resources/source/book_work/` plus the manuscript
  playbooks.
- Coding-agent prompts: `resources/playbooks/coding-agent-workflow.md`.

Everything under `resources/source/` and `resources/context/` (outside
`book_work/`) is intellectual context: it informs reasoning, it does not govern
work. Treat the Trojan Horse Movement Pattern as one applied pattern with
boundary conditions, not a universal theory, and do not brand it externally
unless asked.
