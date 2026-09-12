# Setup, joining, and opting out

## Prerequisites

`git`, and a shared remote everyone can push to. Nothing else. No daemon, no service, no
account, no dependency added to the project.

## First agent — initialize

From the repo root:

```bash
mkdir -p .coord/agents .coord/contracts .coord/decisions .coord/handoffs
```

Write `.coord/README.md` so a teammate who did not opt in understands what they are looking
at:

```markdown
# .coord/

Lightweight coordination notes for people working in this repo with AI agents.
Plain markdown, advisory only.

- `agents/<handle>.md` — one file per agent; only its owner writes it
- `contracts/` — published interfaces others build against
- `decisions/` — decisions we have settled
- `handoffs/` — notes so anyone can resume unfinished work

**This is entirely optional.** Nothing here affects the build, the tests, or the product.
Ignore it freely, or delete the whole directory — nothing breaks.

Stale-claim threshold: 25 minutes.
```

Then create your own agent file from [../assets/agent-file.md](../assets/agent-file.md),
commit, and push.

Or: `scripts/relay.sh init <handle>` does all of the above.

## Joining an existing repo

```bash
git pull --rebase
head -20 .coord/agents/*.md          # who is here, what is claimed
```

Then create `.coord/agents/<your-handle>.md`, claim **paths nobody else holds**, and push.
Read `.coord/decisions/` before proposing anything — settled decisions are closed.

## Leaving cleanly

Set `status: offline`, remove your claims, write a handoff for anything unfinished, push.
Your claims are now free and anyone may take them. Do not delete your agent file — its
history is how others understand what happened.

## If your session crashes

Nothing to do. Your claim goes stale after 25 minutes and a teammate takes it over using
your last handoff. This is the expected path, not an error — which is exactly why handoffs
are written **as you go**, not when you plan to stop.

## Opting out — for teammates who do not want this

**You do not have to do anything.** This adds no hooks, no CI, no required files, no
dependencies, and gates nothing. Work normally.

If you want to know what the others are doing without adopting it, `.coord/` is plain
markdown — read it like any other file.

Agents using this skill are instructed to **never** ask a non-adopter to update a file, and
to treat their absence as normal rather than as a problem. They will coordinate around you
by asking your human what you are touching.

## Removing it entirely

```bash
git rm -r .coord && git commit -m "remove coordination notes"
```

Nothing else changes. No config to unwind, no dependency to uninstall, no build step to
repair. That reversibility is a design requirement, not a courtesy — if removing it ever
breaks something, the protocol was implemented wrongly.

## Keeping it out of a public repo

For a repo that will be judged or published, decide deliberately whether `.coord/` ships.

**Keep it** if the way the team worked is part of the story — at an agents hackathon, honest
evidence of multi-agent coordination reads as interesting rather than as clutter, and it is
small.

**Exclude it** if you would rather it not be judged:

```bash
git rm -r --cached .coord
echo ".coord/" >> .gitignore
```

Coordination then happens on a branch the team shares but does not merge, or through a
second remote. The protocol is unchanged — only where the commits land.

**Never** leave secrets in `.coord/` under either choice.

## Adapting the defaults

The two tunable numbers, both recorded in `.coord/README.md`:

| Default | Meaning | Tune to |
|---|---|---|
| **25 min** stale-claim threshold | when a claim may be taken over | shorter for a sprint, longer for multi-day |
| **~15 min** heartbeat | how often to push state while building | state changes, not a timer |

Everything else — handles, claim globs, contract format — is convention. Agree on changes in
a decision record so every agent reads the same rules.
