# CopilotKit + AG-UI 🏆

**Named prize: Best Use of CopilotKit — purple AirPods Max per team member.**

Docs: <https://docs.copilotkit.ai> · AG-UI: <https://docs.ag-ui.com> ·
Protocol repo: <https://github.com/ag-ui-protocol/ag-ui>
Retrieved 2026-09-12.

## What it is ✅

CopilotKit is an **Agentic Application Platform**: an open-source framework plus a cloud
platform for building and running agentic applications in production. Its stack connects AI
agents to the products users actually use, through **in-app actions, generative UI,
real-time context awareness**, and support for the **AG-UI, MCP and A2A** protocols.

This is the single closest sponsor to the hackathon's premise — "agents that appear inside
the tools people already use" is CopilotKit's entire product thesis.

## AG-UI — the Agent-User Interaction Protocol ✅

An **open, lightweight, event-based protocol** standardizing real-time communication
between AI agents and user-facing applications. It is the general-purpose, bi-directional
connection between a front end and any agentic backend — turning an agent from a background
process into a collaborator.

It builds on standard web protocols (HTTP, WebSockets; SSE is widely used for the event
stream 🟡). The event stream covers:

- streaming chat tokens and multi-turn sessions
- tool lifecycle (started → streaming → finished / failed)
- frontend **and** backend tool calls
- generative UI rendering (static and declarative)
- shared state synchronization (read/write) and agent state snapshots
- thinking steps and reasoning traces
- interrupts and human-in-the-loop pauses
- sub-agent delegation, agent steering, multimodal attachments, custom events

CopilotKit is the first-party TypeScript client. Community SDKs exist for Python, Kotlin,
Go, Dart, Java, Rust, Ruby, C++ and .NET ✅.

**Why this matters for the prize:** AG-UI is what lets you say "the agent and the UI share
state and interrupt each other," rather than "we added a chatbot."

## Core building blocks ✅ (names verified; exact import paths 🟡 — check docs)

**Prebuilt components**
- `CopilotChat` — standalone chat interface
- `CopilotSidebar` — sidebar variant
- `CopilotPopup` — popup variant

**Provider**
- `CopilotKit` — wraps the app, points at your runtime

**Hooks**
- `useCopilotAction` — expose a frontend action the agent can call (**this is the in-app agency**)
- `useCopilotReadable` — feed live app context to the agent (**this is the context awareness**)
- `useComponent` — generative UI rendering (v2) 🟡

**Packages** — `@copilotkit/react-core` (v2 path: `@copilotkit/react-core/v2`) 🟡.
Confirm the current package set and version from the quickstart before installing.

## Backend integrations ✅

16+ documented integrations, including CopilotKit's built-in agent, **LangGraph**
(Python/FastAPI/TypeScript), **Claude Agent SDK** (Python & TypeScript), **AWS Strands**,
**Google ADK**, **Mastra**, **PydanticAI**, **CrewAI Flows**, and more. Any backend that
speaks AG-UI can connect, including one you write yourself.

## Platform features ✅

- **Rich threads** — messages, generative UI and tool activity persist across sessions
- **Generative UI** — agents render real React components, not just text
- **Human-in-the-loop** — approval and interrupt flows
- **Automatic learning** — agents improve through usage

## How to make it load-bearing (prize criteria, practically)

1. **Expose real actions** with `useCopilotAction` that mutate real app state. The agent
   should *do* things in the product, not describe them.
2. **Feed real context** with `useCopilotReadable` — what the user is looking at right now.
3. **Render generative UI** — the agent's output should be an interactive component
   (a form, a comparison table, an approval card), not a paragraph.
4. **Use human-in-the-loop** for anything consequential. It demos beautifully in 2 minutes
   and shows you understood the protocol.
5. Say **AG-UI** in the README and show the shared-state loop. That is the differentiator.

## Time budget ⏱️

A React app + CopilotKit provider + two actions + one readable is realistically **45–75
minutes** for someone who has done React before, assuming keys are ready. Do the quickstart
**before the event**, not during it.

## Verify before you build

- [ ] Current package names and install command from the official quickstart
- [ ] Runtime setup (self-hosted vs. CopilotKit Cloud) and which needs a key
- [ ] Whether your chosen agent backend has a first-party integration
