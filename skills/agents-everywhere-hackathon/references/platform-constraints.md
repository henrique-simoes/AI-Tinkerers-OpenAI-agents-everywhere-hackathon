# Platform constraints — what cannot be built

Saves teams from spending the build window discovering a wall. State as of September 2026;
re-check if a project depends on any of it.

## ❌ Consumer AI mobile apps do not expose general computer use

The Claude, ChatGPT, Gemini and Grok **mobile apps do not offer a general computer-use
capability that drives other installed apps** on the phone. They offer screen/camera
sharing (the model can *see*), voice, and their own in-app tools. Seeing is not acting.

Computer use is a model capability that needs an **environment to act in** — a VM, a
container, a desktop session. Desktop products ship that environment; phone apps run inside
the mobile OS sandbox like every other app.

## ❌ iOS gives third parties no cross-app automation API

- No accessibility-automation API is available to third-party apps. iOS accessibility APIs
  let an app expose *itself* to VoiceOver; they do not let an app drive *other* apps.
- The only sanctioned cross-app surfaces are **App Intents / Shortcuts / Siri**, limited
  strictly to what each app chooses to publish. If a target app ships no intent for an
  action, nothing can synthesize one.
- There is no background model that would let an agent tap through a foreground app.

**Consequence:** "an agent that operates other apps on the user's iPhone" is not buildable
by anyone in 2026.

## ❌ Mobile Chrome does not support extensions

**Chrome on Android and Chrome on iOS have no extension support** — no store, no `chrome.*`
extension APIs, no unpacked loading. Any "mobile browser extension agent" plan has no
platform to run on.

Partial exceptions, none a foundation for a hackathon demo: Firefox for Android supports a
curated subset of add-ons; a few niche Chromium forks on Android support some extensions.

*A **desktop** Chrome extension is entirely viable and a genuinely good "untapped context".*

## 🟡 Android Accessibility Services: possible, but disqualifying here

Android is the one place cross-app UI automation genuinely exists — an app holding
`BIND_ACCESSIBILITY_SERVICE` can read the view hierarchy and dispatch gestures.

For a 4h15m hackathon it fails anyway: very high permission friction (the user must grant a
scary system-level permission by hand), extremely brittle selectors, slow (every step is a
real UI interaction), restricted by Play Store policy — and as **public** code automating a
named commercial app, it collides with the public-repo requirement.

## ✅ What does work

| Approach | Cost | Notes |
|---|---|---|
| **Messaging as the mobile surface** (WhatsApp, Telegram, SMS; work happens server-side) | **Low** | The right answer for "in your pocket". No app store, no permissions, no mobile build. |
| **Server-side browser automation** (Playwright / hosted browser infra) | Medium | Real and demoable. Anti-bot defenses and ToS are the risk. |
| **Official / partner APIs** | Low | Always check first. |
| **Public web surfaces** | Low–medium | Much softer target than a native app. Read the ToS. |
| **Auth0 Token Vault** | Low | The legitimate "act on my accounts" path, and a sponsor. |
| **Desktop browser extension** | Medium | A real untapped context, and a strong CopilotKit fit. |
| **Mobile web app / PWA** | Low | Works, but weak on "untapped context" — still a chat window in a browser. |

## The rule these add up to

**The phone is an interface, not an execution environment.** Put the work server-side and
reach the user through a channel they already have open.
