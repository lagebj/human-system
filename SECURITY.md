# Security Policy

This is a public repository containing executable tooling: the devcontainer
build and lifecycle scripts, the agent-skill sync mechanism, repository
validation scripts, the GitHub Actions workflow, and — in future — static-site
code. This policy covers that tooling.

It does not cover disagreement with the ideas in the repository, or the content
of prose. Those are not security issues; use an issue or a discussion.

## Reporting a vulnerability

Please report privately, not in a public issue.

1. **Preferred:** GitHub private vulnerability reporting — the **"Report a
   vulnerability"** button under this repository's **Security** tab.
2. If that is unavailable, email the maintainer at the address in
   `CITATION.cff`.

Include what you found, where (file and line where possible), how to reproduce
it, and the impact you see. For a suspected vulnerability class, describe the
class rather than a working exploit.

## Scope

In scope:

- shell scripts under `.devcontainer/` and `scripts/`
- the agent-skill sync and pinning mechanism (`.devcontainer/agent-skills*.json`,
  `sync-agent-skills.sh`) — for example, a way to make it execute code from an
  unpinned or attacker-controlled source
- the GitHub Actions workflow(s) under `.github/workflows/`
- future static-site build/deploy code

Out of scope:

- third-party Agent Skills themselves — report those to their upstream projects
  (see `THIRD_PARTY_NOTICES.md`); Human System pins them by commit SHA and
  updates only through a deliberate reviewed flow
- the content, correctness, or framing of intellectual material
- dependency CVEs with no exploit path into this repository's use

## Response

The maintainer will acknowledge a valid report, assess it, and fix or mitigate
it on a branch and PR like any other change. There is no bug-bounty programme.
