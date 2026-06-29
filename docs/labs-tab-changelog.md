# Labs Tab — Change Log (plain language)

A reader-friendly record of what's changing in the Lifeforce Labs tab and why. Newest first.
*(For the technical/version history, see the changelog at the bottom of the prototype / `CHANGELOG.md`.)*

---

## June 26, 2026

**Removed the extra "product detail" and "order review" reference screens.**
Those steps — viewing a product's detail page and checking out / placing an order — happen in the ULC app (run by Kite), not in our Labs tab. Our recommendations just send people into the ULC cart, so we don't need our own versions of those screens.

**The blood-draw appointment card now shows the details that matter.**
It tells members the draw is done in person at their ULC center, shows the date and time with a fasting reminder, and lists the center name + address with a "Get directions" link.
*Why:* people kept asking where and when the draw happens, and whether they need to fast.
*Note:* the specific date/center/address are placeholders for now — the real values will come from the booking.

**Prescription buttons now say "Subscribe" instead of "Buy."**
*Why:* prescriptions are ongoing subscriptions filled by Lifeforce's pharmacies, so "Subscribe" sets the right expectation.

**Added a clear way to see the clinician's note.**
The recommendations screen now has a "View clinician note" button. Before, the note was hard to find (only reachable through "View Results").

---

*Still open / under discussion: where the appointment date & time come from, how prescription bundling and checkout work, what the home-screen score module shows, and how a redraw/retest is handled.*

---

## Notes for the developer (data dependencies)

For whoever builds the production tab — the things our screens depend on:

- **Appointment date/time:** confirm it flows through the booking webhook/API (we already receive the center address + center ID).
- **Prescription "Subscribe":** deep-links into the Kite cart; multi-item bundling / "add all to cart" is still TBD with SprintFWD.
- **Recommendations** are gated to ULC members; clinician-recommended SKUs map to Kite SKUs.
- **Good-faith exam / questionnaire** requirements come from Lifeforce's member-status API (`good_faith_exam_required`, `questionnaire_required`), not from Kite product flags.
- **Blood draws** happen in-center, in person (not at an external lab from the member's view).
