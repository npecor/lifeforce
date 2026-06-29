# CLAUDE.md — ULC × Lifeforce "Labs" tab prototype

Context for Claude Code working in this repo.

## What this is
Lifeforce (a longevity-medicine company) owns the **"Labs" experience that renders as an iframe inside the Ultimate Longevity Center (ULC) mobile app**. ULC = Lifeforce + Sequel Brands (a longevity franchise). The surrounding app is built by a separate team (SprintFWD / "Ashley") on the **Kite (MindBody)** platform. **We control only the Labs tab.** First ULC location launches ~October 2026.

- Live prototype: https://lifeforce-eb85.vercel.app/
- Remote: github.com/npecor/lifeforce

## How it's built (important)
- A single static **`index.html`** (~5,160 lines). No build step — open the file directly or deploy the folder as a static site.
- Screens are **generated in JS, not hand-written markup.**
  - State model = the `variants` array (~line 2570).
  - Screens assemble in `dashboardContent(v)` (~line 3840), which calls render functions such as `bloodDrawBookedCard()`, `clinicianRecommendations()`, `labReportsHub(v)`, `documentCard()`, `lifeScoreCard()`.
  - Icons via `icon(name, size)` → returns a lucide `<i data-lucide="...">` element.
- **Seven-state journey model:** no blood draw → blood draw scheduled → labs processing → results back → post-clinician visit / recommendations active. (See `docs/labs-tab-screen-states-spec.md`.)
- There is a built-in **reviewer comment layer (Supabase, via `/api/config.js`)**. Do not modify it unless explicitly asked.

## Read first
- `docs/labs-tab-screen-states-spec.md` — the canonical V0 state model.
- `docs/labs-tab-module-code-handoff.md`
- `docs/lifeforce-ulc-prototype-spec.md`
- `CHANGELOG.md` — version history of prototype changes.

## Conventions & constraints
- **Brand voice:** evidence-led — "Scientific / Trustworthy / Cool." Spelling is **"Lifeforce"** (one word, not LIFEFORCE/LifeForce). No exclamation points. Avoid "unleash / biohack / journey / seamless / transform." Lead with specifics, not adjectives.
- **CTAs that leave the tab are deep links into the ULC/Kite app** (booking, cart, schedule). When you add/changes such CTAs, keep the reviewer "CTA destination" annotations in sync — see `renderCtaDestinations` and the per-screen destination data.
- **Sample/placeholder data is fine** (dates, center names, addresses); real values come from the booking/member-status API at runtime.
- Make changes on a feature branch; the prototype is reviewed screen-by-screen before merge to `main`.

## Domain notes (from stakeholder meetings)
- **Blood draws happen in-center, in person** at the member's ULC center (not at a lab like Quest from the member's view). On booking, Lifeforce receives the center address + center ID.
- **Prescriptions = subscriptions** (fulfilled by Lifeforce pharmacies). CTA wording is "Subscribe"; it deep-links into the ULC cart. **Supplements are bought in-center in person.** **Recommended services** use a "Book" CTA that deep-links into booking.
- **Recommendations** are gated to ULC members; clinician-recommended SKUs map to Kite SKUs.
- **Good-faith exam / questionnaire** requirements come from Lifeforce's member-status API (`good_faith_exam_required`, `questionnaire_required`), not from Kite product flags.
- Open items / action tracker (external): https://docs.google.com/document/d/19_rflGTS_8aIpGg0L7MaabVaZsb0C2pW2UhVqvzTccc/edit
- ULC Figma (SprintFWD-owned, view-only): https://www.figma.com/design/ZSGbwiCzxuxJ7TeYP2PeuX/ULC-Marketing---App-Designs?node-id=1-6606

## Current branch
`labs-tab-meeting-updates` contains recent edits: prescription CTA Buy→Subscribe; a "View clinician note" button on the post-clinician recommendations screen; and the blood-draw-scheduled card now shows in-center status + appointment date/time + center name/address + a fasting note.
