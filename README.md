# Agents, Everywhere — skills & agent

> **You are on the `skill-agent` branch.** It carries the portable Agent Skills for our
> hackathon team. The project codebase lives on **[`main`](../../tree/main)** — this branch
> is deliberately separate so tooling never clutters the code.

Two skills in the open [Agent Skills](https://agentskills.io) format — originally developed
by Anthropic, released as an open standard. They work in **any** compatible harness:
Claude Code, Codex, Cursor, VS Code / GitHub Copilot, Gemini CLI, OpenCode, Goose, Amp,
Zed, Roo Code, Factory, Kiro, Letta, Firebender and more.

| Skill | What it does | Required? |
|---|---|---|
| **`agents-everywhere-hackathon`** | Challenge brief, the five mandatory deliverables, the 4h15m build window, judging, and the full sponsor stack with real SDK detail | Recommended |
| **`agent-relay`** | Coordination when several people or agents build in the same repo at once — claims, interface contracts, handoffs — over git alone | Optional |

**Both are optional and independent.** Install either, both, or neither. Nothing in the
project depends on them. If you'd rather use your own workflow, you lose nothing.

---

## Install

### 1. Get the skills

```bash
git clone --branch skill-agent --single-branch \
  https://github.com/henrique-simoes/AI-Tinkerers-OpenAI-agents-everywhere-hackathon.git ae-skills
```

### 2. Copy them where your agent looks

**Project-scoped** — lives in a repo, shared with whoever clones it:

| Harness | Path |
|---|---|
| VS Code / GitHub Copilot, and the cross-tool default | `.agents/skills/` |
| Claude Code | `.claude/skills/` |
| Most others | check your tool's skills docs; many read `.agents/skills/` |

**User-scoped** — available in every project you open:

| Harness | Path |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Codex | `~/.codex/skills/` |
| Others | see your tool's skills documentation |

```bash
# cross-tool default, project-scoped
mkdir -p .agents/skills && cp -R ae-skills/skills/agents-everywhere-hackathon \
                                 ae-skills/skills/agent-relay .agents/skills/

# Claude Code, available everywhere
mkdir -p ~/.claude/skills && cp -R ae-skills/skills/agents-everywhere-hackathon \
                                   ae-skills/skills/agent-relay ~/.claude/skills/
```

Want just one? Copy just that folder.

### 3. Check it worked

Start a **new** session, then ask your agent something like:

- *"What do we have to submit, and by when?"*
- *"Which sponsor should we use for an agent that lives inside a workspace?"*
- *"Can an agent drive the iFood app on my phone?"*

If it answers from the skill — deliverables, the 15:30 deadline, the two named sponsor
prizes — you're set. Your agent loads only each skill's name and description at startup and
pulls in the detail on demand, so carrying both costs almost nothing.

---

## What's inside

```
skills/
├── agents-everywhere-hackathon/
│   ├── SKILL.md                      brief, the 3 hard constraints, scoping rules, stack picker
│   ├── references/
│   │   ├── rules-and-deliverables.md schedule, 5 deliverables, judging, prizes
│   │   ├── sponsors-overview.md      tiers, the two named prizes, how to choose
│   │   ├── copilotkit-and-ag-ui.md   🏆 components, hooks, AG-UI events, prize criteria
│   │   ├── ambiguous-ai.md           🏆 provisioning API, MCP, pricing, prize criteria
│   │   ├── models-and-gateways.md    OpenAI, OpenRouter, Kimchi, Mozilla.ai
│   │   ├── supporting-stack.md       Exa, Trigger.dev, Auth0 Token Vault
│   │   ├── platform-constraints.md   what cannot be built, especially on phones
│   │   └── submission-checklist.md   hour-by-hour ship-day plan
│   └── assets/idea-template.md
└── agent-relay/
    ├── SKILL.md                      the one idea, five rules, sync loop, when NOT to use it
    ├── references/
    │   ├── protocol.md               file format, claims, staleness, contracts, collisions
    │   ├── phases.md                 ideation / documentation / implementation playbooks
    │   └── setup-and-optout.md       joining, leaving, removing it entirely
    ├── assets/                       agent file, handoff note, decision record
    └── scripts/relay.sh              optional helper: init, status, sync, publish, stale
```

Every factual claim about a sponsor API is tagged **✅ verified** (read on the sponsor's own
docs) or **🟡 assumed** (check before depending on it), with source URLs and a retrieval
date. Nothing was invented.

---

## How `agent-relay` works

Git is the bus — no server, daemon, MCP or network calls, because the repo is the only thing
all our harnesses share.

Each agent writes exactly one file, `.coord/agents/<handle>.md`, that **only it may write**.
Because no two agents ever touch the same file, `git pull --rebase` always succeeds and
coordination **cannot** produce a merge conflict. There's no shared board file — the board is
derived by reading everyone's files.

```bash
./relay.sh init ana-codex          # your handle is <person>-<harness>
./relay.sh status                  # who is doing what
./relay.sh publish "claimed the api"
```

The script is convenience only; the protocol is plain markdown and plain git, and works by
hand in any harness.

**It stays optional.** No hooks, no CI, no dependencies, nothing gated. `rm -rf .coord/`
removes it with zero effect on the product.

---

## Keeping it current

The organizers release **judging methodology and prize criteria before the event.** When
that lands, update `skills/agents-everywhere-hackathon/references/rules-and-deliverables.md`
and bump `metadata.version`. Flip 🟡 → ✅ as you verify sponsor APIs against current docs.

## License

MIT — see [LICENSE](LICENSE). Share these with other teams freely.

---

*Built at the AI Tinkerers Global Hackathon, presented by OpenAI. This is a participant
project — not affiliated with, or endorsed by, OpenAI or AI Tinkerers.*
