---
handle: <person>-<harness>
human: <name>
harness: <Claude Code | Codex | Cursor | Gemini CLI | ...>
model: <model you are running on>
status: <working | idle | blocked | offline>
updated: <YYYY-MM-DDTHH:MM±HH:MM>
---

## Now
<One line: what you are doing right now, and after 14:00 the deadline you are running to.>

## Claims
<Path globs, or named work items for non-file work. Claim before you build. Never overlap
another agent's claim. Delete a line to release it.>

- `path/to/area/**` — <why you hold it>
- `deliverable/video` — <when you will do it>

## Contracts I publish
<Interfaces you own in .coord/contracts/. Others build against these. Mark draft or stable.>

- [<name>](../contracts/<name>.md) — <draft | stable since HH:MM>

## Blocked on
<What is stopping you AND what would unblock you. "nothing" if clear. If blocked, also go
claim something else — never idle.>

- nothing

## Recent
<Last 3-5 lines, newest first. Facts, not intentions — a stranger on a different model must
be able to act on these. Older lines move to a handoff note or are dropped.>

- HH:MM <what changed>
