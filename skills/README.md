# Shareable Agent Skills

Two portable skills for the team. Both follow the **open Agent Skills standard** (originally developed by Anthropic, released
as an open format), so they work in any compatible harness — Claude Code, Codex, Cursor,
VS Code / GitHub Copilot, Gemini CLI, OpenCode, Goose, Amp, Zed, Roo Code, Factory, Kiro
and many others. Both are optional and independent: install either, both, or neither.

| Skill | What it gives you |
|---|---|
| **`agents-everywhere-hackathon`** | The rules, deliverables, clock, judging bar, and the full sponsor stack with real SDK detail |
| **`agent-relay`** | Coordination when several people/agents build in the same repo at once — over git, no services |

---

## 1. `agents-everywhere-hackathon`

Everything the team needs to know about the **AI Tinkerers "Agents, Everywhere"** hackathon.

```
agents-everywhere-hackathon/
├── SKILL.md                          the brief, constraints, scoping rules, stack picker
├── references/
│   ├── rules-and-deliverables.md     schedule, deliverables, judging, prizes, unpublished rules
│   ├── sponsors-overview.md          tiers, the two named prizes, how to choose
│   ├── copilotkit-and-ag-ui.md       🏆 components, hooks, AG-UI events, prize criteria
│   ├── ambiguous-ai.md               🏆 provisioning API, MCP, pricing, prize criteria
│   ├── models-and-gateways.md        OpenAI, OpenRouter, Kimchi, Mozilla.ai
│   ├── supporting-stack.md           Exa, Trigger.dev, Auth0 Token Vault
│   ├── platform-constraints.md       what cannot be built, especially on phones
│   └── submission-checklist.md       hour-by-hour ship-day plan
└── assets/
    └── idea-template.md              scoping template that forces a verdict
```

Facts are marked **✅ verified** (read on the sponsor's own docs or the event page) or
**🟡 assumed** (check before depending on it). Every reference file carries source URLs and
a retrieval date.

---

## 2. `agent-relay` (optional)

Lets several agents — on different machines, harnesses and models, including other copies of
this same skill — work in one repo without colliding.

```
agent-relay/
├── SKILL.md                        the one idea, five rules, sync loop, when NOT to use it
├── references/
│   ├── protocol.md                 file format, claims, staleness, contracts, collisions
│   ├── phases.md                   ideation / documentation / implementation playbooks
│   └── setup-and-optout.md         joining, leaving, removing it entirely
├── assets/
│   ├── agent-file.md               your one file
│   ├── handoff.md                  stateless resume note
│   └── decision.md                 decision record
└── scripts/
    └── relay.sh                    optional helper: init, status, sync, publish, stale
```

**How it works.** Git is the bus — no server, daemon, MCP or network calls. Each agent writes
exactly one file, `.coord/agents/<handle>.md`, that **only it may write**. Because no two
agents ever touch the same file, `git pull --rebase` always succeeds and coordination cannot
produce a merge conflict. There is no shared board file; the board is derived by reading
everyone's files.

It covers claiming work before starting it, publishing interface contracts so others build
against stubs instead of waiting, taking over claims from crashed sessions (25-minute
staleness), recording decisions, and handoff notes any other agent can resume from.

**It is optional and stays that way.** No hooks, no CI, no dependencies, nothing gated. A
teammate who ignores it does nothing differently. `rm -rf .coord/` removes it with zero
effect on the product — that reversibility is a design requirement.

```bash
./relay.sh init <person>-<harness>    # e.g. ana-codex
./relay.sh status                     # who is doing what
./relay.sh publish "claimed the api"
```

The script is convenience only; the protocol is plain markdown and plain git, and works by
hand in any harness.

---

## Install

Copy the skill folder(s) you want into your harness's skills directory.

**Project-scoped** (shared with the team through the repo):

| Harness | Path |
|---|---|
| VS Code / GitHub Copilot, and the cross-tool default | `.agents/skills/` |
| Claude Code | `.claude/skills/` |
| Most others | check your tool's skills docs; many read `.agents/skills/` |

**User-scoped** (available in every project):

| Harness | Path |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.codex/skills/` |
| Others | see your tool's skills documentation |

### One-liners

```bash
# clone this repo, then — project-scoped, cross-tool default
mkdir -p .agents/skills
cp -R skills/agents-everywhere-hackathon skills/agent-relay .agents/skills/
```

```bash
# user-scoped, Claude Code
mkdir -p ~/.claude/skills
cp -R skills/agents-everywhere-hackathon skills/agent-relay ~/.claude/skills/
```

Then start a new session. The agent loads only the skill's `name` and `description` at
startup, and pulls in the body — and the reference files — only when a task calls for
them. Ask something like *"what do we have to submit, and by when?"* or *"which sponsor
should we use for an agent inside a workspace?"* to confirm it activates.

## Validate

```bash
skills-ref validate ./agents-everywhere-hackathon
skills-ref validate ./agent-relay
```

(<https://github.com/agentskills/agentskills>)

## Maintaining them

- The organizers release **judging methodology and prize criteria before the event.** When
  that lands, update `references/rules-and-deliverables.md` and bump `metadata.version`.
- Flip 🟡 → ✅ as you verify sponsor APIs against current docs.
- Keep `SKILL.md` under 500 lines; detail belongs in `references/`.

## License

MIT. Share it freely with teammates and other teams.
