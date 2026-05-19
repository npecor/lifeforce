# Tracked Changes Summary

This is the reviewer-facing summary of the prototype changes that matter to the design/product audience.

## v0.6 · Sticky CTA cleanup

- Moved recommendations, product detail, and order review purchase CTAs out of scrollable screen content and into phone-level bottom bars.
- Anchored purchase bars above the ULC bottom navigation.
- Added extra scroll padding on screens with bottom purchase bars so content can scroll clear of the CTA area.
- Tightened the product detail sticky bar copy to emphasize product name, price, and one primary action.

## v0.4 · Care plan refinement

- Simplified the post-clinician visit / care plan active state.
- Replaced repeated recommendation/product CTAs with one top-level care plan CTA and one prescription product CTA.
- Changed the top care plan CTA to View Care Plan.
- Replaced generic supplement examples with prescription recommendations: Estradiol Patch and Semaglutide.
- Moved Prescription Recommendations above LifeScore and Lab Reports in the post-clinician state.
- Updated the labs/no-member card to use user-facing biomarker testing language and removed TBD chips from the mobile UI.

## v0.3 · MVP state model pass

- Updated dashboard states to reflect the May 15 operational journey.
- Added labs/no-member and blood-draw-booked states.
- Changed blood draw terminology to Schedule Blood Draw.
- Hid Health Questionnaire from the unscheduled member no-labs state.
- Split labs processing by questionnaire incomplete vs complete.
- Removed next-draw-due logic and LifeForce membership management from dashboard states.

## v0.2 · Pre-MVP state update snapshot

- Snapshot created before May 15 meeting-driven state model changes.
- Current prototype includes dashboard states, reports/results, and recommendations/products.
- This is the baseline to revert to if the next round of changes goes in the wrong direction.

