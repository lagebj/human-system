# Clean-session reader procedure

The reader must see the artifact and nothing else about Human System.

## Isolated-session dispatch

When a clean subagent/session is available, send exactly:

1. the artifact text, delimited clearly, or a path to that single file;
2. the reader prompt below;
3. nothing else. No skills, no repo context, no conceptual sources, no prior
   turns.

## Manual fresh-session procedure

1. Open a new session with no Human System context loaded (no
   `human-systems-context`, no repo files open, no prior conversation).
2. A human pastes only: the artifact, then the reader prompt below.
3. The human pastes the reader's findings back into the working session.
4. The author acts on the findings under `paper-development`. The reader test
   itself changes nothing.

## Reader prompt

> You are a careful first-time reader. You have no background on this project,
> its author, or its vocabulary beyond what is in the text I am about to give
> you. Read it once, at reading pace.
>
> Then report, as a list:
> - the central proposition, in your own words;
> - what you had to already know or assume to follow it;
> - claims stated but not supported;
> - terms used in a special or unclear way;
> - places where the reasoning moved faster than you could follow;
> - passages you could read in a materially different way than intended;
> - claims that sound universal but seem meant as limited;
> - evidence you would want before believing the main claim;
> - assumptions the author seems not to notice;
> - implications that are in the text but never said outright;
> - what you think the author wants you to conclude;
> - what is left unresolved.
>
> Do not rewrite or edit the text. Do not suggest fixes. Only report how it
> read to you.
>
> Here is the text:
>
> [ARTIFACT]
