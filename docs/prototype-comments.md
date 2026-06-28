# Prototype review comments (snapshot)

Durable copy of the in-prototype reviewer comments (NP = Natasha Pecor), captured so they aren't lost if the Supabase comment layer is cleared or changes are pushed. Status reflects the `labs-tab-meeting-updates` branch.

Status key: **OPEN** = not started · **IN PROGRESS** = partially addressed · **DONE** = handled on branch · **TODO-REMOVE** = screen to delete · **INFO** = note/confirmed capability.

## Dashboard · No blood draw performed
- **#1 (Jun 9)** — Decide when the Longevity Assessment should be available. Only when there have been no labs? Will it only live on the Booking screen? · **OPEN** (content decision — one of the home-module judgment calls)
- **#3 (Jun 10)** — We can get membership status. · **INFO** (capability confirmed with SprintFWD)
- **#13 (Jun 24)** — Need to add a CTA to support and deep-link (to the ULC contact page). · **OPEN / TODO**

## Dashboard · Blood draw scheduled
- **#9 (Jun 24)** — Add location info and appointment info. · **DONE** (card now shows appointment date/time, fasting note, center name + address + Get directions — placeholder data; confirm appt date/time comes via the booking API)

## Dashboard · Labs processing · Questionnaire complete
- **#4 (Jun 10)** — "Products you may want to ask your doctor about…" (pre-visit discovery). · **OPEN** (content decision — which products, where)

## Dashboard · Results back · Questionnaire incomplete
- **#10 (Jun 24)** — Need to handle redraw / retest. · **OPEN** (surfacing + notification path; ULC triggers redraw → new credit)

## Dashboard · Post-clinician visit · Recommendations active
- **#2 (Jun 10)** — Question to Joel: what's the right order — Prescriptions, Supplements, Recommended Services? Where does IV go? · **OPEN**
- **#5 (Jun 10)** — "Add to Cart" CTA — figure out the flow that follows. · **IN PROGRESS** (prescription CTA changed to "Subscribe"; downstream cart flow still TBD)
- **#6 (Jun 10)** — Work with SprintFWD on bundling order; maybe an "add all to cart" button. · **OPEN**
- **#11 (Jun 24)** — Clinician's note. · **IN PROGRESS** (added a "View clinician note" button on this screen; destination/flow TBD)

## Recommendation Support Screens (reference-only · "Needs review")
These two are NOT core dashboard-flow screens — they live only in the `#productFlow` "13 · Recommendation Support Screens · Needs review" section (built by `productDetailPage()` / `orderReviewPage()`).
- **#7 (Jun 10) — Product Detail (`product-detail`, labeled "13A · Prescription Detail")** — remove; product detail will be owned by Kite. · **TODO-REMOVE**
- **#8 (Jun 10) — Review Order (`review-order`, labeled "13B · Review Order")** — remove; checkout/order owned by Kite. · **TODO-REMOVE**

> Decision (Jun 26): remove the **entire** Recommendation Support Screens section (both screens + heading + dead CTA annotations) once the design agent's pass lands and is pushed. Recommendation "Subscribe" CTAs just deep-link out to the Kite cart, so nothing in the core flow depends on these screens.

## Lab Report Detail
- **#12 (Jun 24)** — Allow download, and upload of any document. · **OPEN / TODO**

---
*Captured from the prototype comment panel. Reconcile against the live comments periodically; resolve here as items ship.*
