# Ambiguous AI 🏆

**Named prize: Best Use of Ambiguous AI — one NVIDIA DGX Spark for the team.**

Site: <https://www.ambiguous.ai/> · Agents guide: <https://www.ambiguous.ai/agents> ·
API reference: <https://www.ambiguous.ai/agents/api> ·
Developer console: <https://app.ambiguous.ai/developers>
Retrieved 2026-09-12.

## What it is ✅

The workspace for human–AI collaboration: **17 productivity apps rebuilt from scratch** so
work flows between them — and so AI coworkers operate in the same apps, on the same data,
as everyone else.

Apps include: **Docs, Sheets, Slides, Wiki, Mail, Chat, Forms, Sign, Tasks, Calendar, CRM,
Drive, Identity, Assistant, Admin, Automations** ✅ (plus one more to reach 17).

## The idea that wins the prize ✅

> Each AI coworker has **its own identity** and works in the same apps and with the same
> data as the rest of the team. You can **send it an email, message it in chat, assign it a
> task, or @mention it in a comment.**

Agents get **their own login credentials** and access to: email on your domain, Docs and
Sheets, the CRM pipeline, Calendar, Drive storage, Chat channels, and Tasks ✅.

This is as close to a literal restatement of the hackathon brief as any sponsor gets:
an agent inside the environment where people already work, reachable the way a colleague is.

## Developer surface ✅

**Provision an agent — one API call:**

```http
POST /api/admin/users/provision-agent
Authorization: Bearer ak_...

{
  "display_name": "Research Bot",
  "role": "member",
  "focus_areas": ["research", "reporting"]
}
```

API keys use the `ak_` prefix ✅.

**Then drive it over MCP:**

```ts
await mcp.callTool("docs.create", {
  title: "Q4 Planning",
  content: [...]
})
```

Tool names follow an `<app>.<verb>` shape (e.g. `docs.create`) ✅ from the site's own
example. **The full tool list, the MCP server URL, and the CLI commands are not on the
public marketing pages** 🟡 — pull them from
<https://www.ambiguous.ai/agents/api> and the developer console before building.

MCP setup is documented for Claude, ChatGPT, Cursor and other clients ✅. The stated
onboarding claim is **provision via one API call, working via MCP or CLI in under a
minute** ✅.

## Pricing ✅

- **Free** — up to 5 members, **1,000 AI actions/month**
- Top-up — $5 = 500 actions, non-expiring
- Pro — $20/seat, 5,000 actions each

The built-in Assistant consumes the workspace action budget; **external agents are free for
routine CRUD operations** ✅. A hackathon team fits comfortably in the free tier.

## How to make it load-bearing (prize criteria, practically)

1. **Give the agent a real identity** and a role — it is a coworker, not a script.
2. **Make it reachable the human way** — it should respond to an email, a chat message, an
   @mention, or an assigned task. That is the demo moment.
3. **Produce artifacts people continue working on** — a Doc, a Sheet, a CRM record, a
   Calendar entry that a human then edits in the same workspace.
4. **Close the loop across apps.** One agent that reads Chat, writes a Doc, files a Task and
   updates the CRM demonstrates the whole product thesis in 90 seconds.
5. Avoid the cosmetic version: a single `docs.create` call with no identity and no human
   round-trip.

## Time budget ⏱️

Provisioning is genuinely fast. The risk is **discovering the MCP tool surface live** —
read the API reference and list the tools **before the event**, and note which apps you
actually need.

## Verify before you build

- [ ] MCP server URL and exact client config
- [ ] Complete tool list and argument schemas for the apps you need
- [ ] Whether the CLI path is faster than MCP for your harness
- [ ] What counts as an "AI action" against the 1,000/month free budget
