# ULC x Lifeforce Prototype Changelog

## v0.12 · System fallback states + UI polish

Date: June 30, 2026

Added:
- System / Fallback States section (required by the ULC integration spec): a loading skeleton, a connection-failure state ("We can't load your labs right now"), and a service-unavailable state ("Labs is temporarily unavailable"). Each uses calm, plain-language copy, reassures the member their lab data is safe, and offers Try again plus a path to contact ULC.

Changed:
- Refined the blood-draw-scheduled card: status carried by a green check bubble, distinct row icons (calendar / clock / pin), fixed "Get directions" rendering as a stray boxed button, top-aligned row icons, neutral note styling so it reads as guidance (not a second button), and a title-only header.
- Redesigned the prescription selection checkbox: filled dark checked state with an animated checkmark, clearer unchecked state, hover and focus-visible states, and a larger (44px) touch target.

Known open questions:
- A total iframe load failure (our code never runs) can't be handled by us; the ULC app or a no-JS static fallback must render it. Ownership TBD with SprintFWD.

## v0.11 · Labs tab meeting updates

Date: June 26, 2026

Added:
- Prescription recommendation CTAs changed from "Buy" to "Subscribe" (prescriptions are ongoing subscriptions, fulfilled by Lifeforce pharmacies; deep-link into the Kite cart).
- Added a "View clinician note" entry point on the post-clinician recommendations screen.
- Redesigned the blood-draw-scheduled card: in-center status, appointment date/time + fasting note, center name/address with Get directions, and a note that the clinician visit unlocks once results are back.
- Removed the Recommendation Support Screens reference section (Product Detail + Review Order); product detail and checkout are owned by Kite.
- Added a "Need help? Contact ULC." link at the bottom of every screen, deep-linking to the ULC app's Contact Us page.
- Added an "Edge State Modules" library section for rare/conditional modules pulled into screens as needed.
- Added a "Follow-up blood draw recommended" redraw/retest module (in Edge State Modules); trigger/notification/credit flow flagged for devs to define.

Planned (this round):
- Order of Prescriptions / Supplements / Recommended Services (and where IV fits).
- Add-all-to-cart / bundling for multiple recommendations (with SprintFWD).
- "Products to ask your doctor about" pre-visit discovery.

Known open questions:
- Does appointment date/time flow through the booking webhook/API? (center address + ID already do)
- Prescription bundling/checkout flow with SprintFWD.

## v0.10 · Final review cleanup

Date: June 09, 2026

Summary:
- Replaced "Needs Ashley" / "Needs SprintFWD" with "Needs SprintFWD input" in CTA destination annotations.
- Simplified Open Questions into "Questions for SprintFWD" and "Internal LifeForce Questions."
- Removed or archived older granular open questions covered by the SprintFWD agenda.
- Removed the global CTA destination legend while keeping per-screen CTA destination panels.
- Removed the rigid "What happens next" timeline and kept the conceptual Measure -> Review -> Personalize journey module.
- Removed unsupported locked/pending Recommendations screen from the core flow.
- Removed biomarker-specific "Recommended next steps" from Biomarker Detail.
- Removed top-level filter chips from Lab Reports Listing while keeping Optimal / Normal / Out of Range summary chips on report cards.
- Updated in-progress Health Questionnaire progress from section-based language to percentage-based progress.
- Updated Results Back / Questionnaire Incomplete hierarchy so Schedule Clinician Visit is the highest-priority CTA when available.
- Removed "Post-visit" capsule from the post-clinician recommendations card.
- Restored individual titles for Recommendation Support Screens.

User states affected:
- Results Back · Questionnaire Incomplete
- Labs Processing · Questionnaire Complete
- Biomarker Detail
- Lab Reports
- Post-Clinician Visit · Recommendations Active
- Recommendation Support Screens
- Open Questions
- Changelog

Known open questions:
- Which ULC/Kite routes need SprintFWD input before implementation?
- Should recommendation support screens remain as reference-only prototype material?

Risky changes or assumptions:
- CTA destination annotations remain best-guess reviewer markup until SprintFWD confirms ULC/Kite destinations.

## v0.9 · UX hierarchy cleanup

Date: June 09, 2026

Summary:
- Clarifies the next best action for each dashboard state.
- Removes broad product browsing from early dashboard states.
- Keeps the no-blood-draw state focused on Schedule Blood Draw, Longevity Assessment, and lightweight journey context.
- Adds a What happens next timeline to early, processing, and results-back states.
- Reorders results-back states so Health Questionnaire, View Results, Schedule Clinician Visit, and LifeScore follow the requested priority.
- Adds clinical rationale lines to prescription, supplement, and service recommendations.
- Keeps Documents lower priority after recommendations, LifeScore, and lab reports.
- Updates CTA destination annotations so assumptions remain visible and uncertain ULC/Kite deep links are marked Needs SprintFWD input.

User states affected:
- No Blood Draw Performed
- Blood Draw Scheduled · Questionnaire Not Started
- Labs Processing · Questionnaire Incomplete
- Labs Processing · Questionnaire Complete
- Results Back · Questionnaire Incomplete
- Results Back · Questionnaire Complete
- Post-Clinician Visit · Recommendations Active

Known open questions:
- Which scheduling, booking, service, and prescription destinations can ULC/Kite deep-link to?
- Should generic product browsing exist inside the Labs/Lifeforce tab, or remain outside this embedded flow?
- Is Schedule Clinician Visit supported from results-back states before and after questionnaire completion?
- Which recommendation examples, prices, and services are approved for stakeholder review?

Risky changes or assumptions:
- Browse Products is de-emphasized in the active dashboard states until its role and destination are confirmed.
- Schedule Clinician Visit remains visible with Needs SprintFWD input routing status.
- Prescription Buy and service Book CTAs are prototype assumptions pending ULC/Kite confirmation.

## v0.8 · June 09 review refinements

Date: June 09, 2026

Summary:
- Renames the first dashboard state to No Blood Draw Performed and clarifies Blood Draw Scheduled · Questionnaire Not Started.
- Removes standalone processing and broad catalog screens from the core all-screens flow.
- Adds dedicated LifeScore and Documents detail screens based on the supplied references.
- Expands LifeScore cards with Quality of Life, Longevity Risk, and Biological Age.
- Updates post-clinician recommendations to separate Prescription Recommendations, Supplement Recommendations, and Recommended Services.
- Changes prescription recommendation CTAs to Buy.
- Changes supplement recommendations to Available at ULC language instead of in-app purchase buttons.
- Adds Documents modules to results-back and post-clinician dashboard states.
- Updates lab report dates and keeps report history in reverse chronological order.
- Adds a reusable Follow-up Health Questionnaire state for repeat blood draws.

User states affected:
- No Blood Draw Performed
- Blood Draw Scheduled · Questionnaire Not Started
- Labs Processing · Questionnaire Incomplete
- Labs Processing · Questionnaire Complete
- Results Back · Questionnaire Incomplete
- Results Back · Questionnaire Complete
- Post-Clinician Visit · Recommendations Active
- Lab Reports
- LifeScore
- Documents
- Clinician Recommendations · Needs review

Known open questions:
- Which CTAs and destinations are deep-linkable from the embedded Lifeforce view?
- Can ULC/Kite deep link to specific services, prescription product detail, cart, and checkout?
- Will Lifeforce have access to ULC membership or purchase status?
- Are supplements in-app, BOPUS, or in-store only?
- Does ULC/Lifeforce have a formal Care Plan object, or should the UI use clinician recommendations and next steps language?
- Which ULC services/modalities and imagery are available for recommendations?
- Should Documents upload and LifeScore detail be included in V0?

Risky changes or assumptions:
- Supplement recommendations assume an in-center fallback until purchase handling is clarified.
- Prescription, supplement, and service examples are placeholders pending ULC/Kite catalog and clinical review.
- Products/commerce screens are labeled Needs review because deep-link and checkout behavior is still unresolved.

## v0.7 · V0 state simplification

Date: June 09, 2026

Summary:
- Collapses the dashboard state model around blood draw and results status instead of member/non-member segmentation.
- Replaces the earlier member/no-member/one-off-labs dashboard split with a universal No Labs Performed state for V0.
- Keeps the no-labs screen minimal: orientation, Schedule Blood Draw, Book Longevity Assessment, and what unlocks after bloodwork.
- Keeps Health Questionnaire gated until a blood draw is scheduled.
- Allows results access when results are back while keeping LifeScore gated until Health Questionnaire is complete.
- Adds Schedule Clinician Visit as a visible action when results are back.
- Moves post-clinician recommendations to the top of the post-visit state.
- Splits recommendations into prescription recommendations, supplement recommendations, and ULC services/modalities.
- Changes supplement recommendation language to Available at ULC instead of in-app purchase language.
- Adds Documents as a lower-priority utility section after recommendations, LifeScore, and lab reports.
- De-emphasizes broad product browsing in favor of recommendation-driven actions.

User states affected:
- No Labs Performed
- Blood Draw Scheduled / Not Completed
- Labs Processing · Questionnaire Incomplete
- Labs Processing · Questionnaire Complete
- Results Back · Questionnaire Incomplete
- Results Back · Questionnaire Complete
- Post-Clinician Visit / Recommendations Active

Known open questions:
- Which ULC/Kite destinations can be deep-linked from the embedded Labs experience?
- Can Lifeforce receive membership or one-off-lab purchase status?
- What should one-off labs users see if status is unavailable?
- Are supplements purchasable in-app, BOPUS, or in-center only?
- Which ULC services/modalities can be recommended and deep-linked?
- Should Documents/upload and LifeScore detail be included in V0?

Risky changes or assumptions:
- Member vs non-member differences are intentionally collapsed for V0 because status may not be available.
- Prescription, supplement, and service recommendation examples are prototype placeholders pending ULC/Kite deep-link and catalog confirmation.
- Supplement recommendations assume an in-center fallback until commerce support is clarified.

## v0.6 · Sticky CTA cleanup

Date: May 18, 2026

Summary:
- Moves recommendations, product detail, and order review purchase CTAs out of scrollable screen content and into phone-level bottom bars.
- Anchors the purchase bars above the ULC bottom navigation.
- Adds extra scroll padding on screens with bottom purchase bars so content can scroll clear of the CTA area.
- Tightens the product detail sticky bar copy to emphasize product name, price, and one primary action.

User states affected:
- Product Detail
- Review Order
- Recommendations

Known open questions:
- Should order review keep the secondary Back to Recommendations action in the bottom bar, or move it inline as a text link?

Risky changes or assumptions:
- Purchase bars are treated as prototype shell/mobile viewport overlays for these screens, not inline content cards.

## v0.4 · Recommendation refinement

Date: May 18, 2026

Summary:
- Simplifies the post-clinician visit / recommendations active state.
- Replaces repeated recommendation/product CTAs with one top-level recommendation CTA and one prescription product CTA.
- Adjusts the post-clinician hierarchy before the later v0.7 recommendation-led structure.
- Replaces generic supplement examples with Estradiol Patch and Semaglutide in the post-clinician prescription recommendations module.
- Moves prescription recommendations above LifeScore and Lab Reports.
- Updates the labs/no-member card to use user-facing biomarker testing language and removes TBD chips from the mobile UI.

User states affected:
- Non-member · one-off labs
- Post-clinician visit · Recommendations active

Known open questions:
- Should post-clinician product CTA language use Subscribe, Order, Add to Cart, or View Details?
- Which Rx products and prices are approved for prototype/demo use?
- Where should product ordering deep-link in the main ULC app?

Risky changes or assumptions:
- Estradiol Patch and Semaglutide are used as prototype examples and should be validated by the clinical/product team.
- The post-clinician state now emphasizes prescription recommendations over supplement recommendations.

## v0.3 · MVP state model pass

Date: May 18, 2026

Summary:
- Updates the prototype toward the May 15 MVP operational journey.
- Adds labs/no-member and blood-draw-booked states.
- Standardizes blood draw CTA terminology around Schedule Blood Draw.
- Hides Health Questionnaire before blood draw is scheduled.
- Splits labs processing into questionnaire incomplete and questionnaire complete states.
- Allows results access when questionnaire is incomplete while gating LifeScore.
- Renames the post-clinician state to clarify when recommendations become active.
- Removes next-draw-due logic from the production-facing state set.
- Removes Lifeforce membership management from dashboard states.

User states affected:
- Non-member · No labs
- Non-member · one-off labs
- Member · No labs · draw not scheduled
- Member · Blood draw booked · draw not completed
- Labs processing · questionnaire incomplete
- Labs processing · questionnaire complete
- Results back · questionnaire incomplete
- Results back · questionnaire complete
- Post-clinician visit · Recommendations active

Known open questions:
- What should the non-member/no-labs primary CTA be?
- What does labs/no-member or one-off labs include?
- Do one-off labs users receive LifeScore, recommendations, or clinician visits?
- Are supplements purchasable in-app or in-store only?
- Which ULC services can be recommended before clinician visit?
- What booking status/date data can Lifeforce receive from ULC/Kite?

Risky changes or assumptions:
- One-off labs content is represented as an MVP placeholder with clear TBD items.
- Supplement/product recommendations remain cautious before clinician visit until purchase handling is clarified.
- Future blood draw cadence is intentionally omitted because Kite/ULC lifecycle systems own eligibility and reminders.

## v0.2 · Pre-MVP state update snapshot

Date: May 18, 2026

Summary:
- Captures the prototype before the May 15 meeting-driven state model changes.
- Includes current dashboard states, reports/results flow, and recommendations/products flow.
- Use this as the revert point if the next round of changes goes in the wrong direction.

User states affected:
- No production state model changes in this entry.
- Snapshot preserves the current pre-MVP dashboard and flow structure.

Known open questions:
- Which non-member primary CTA should lead: Explore Membership, Schedule Blood Draw, or Book Longevity Assessment?
- What is included in labs-no-member / one-off labs?
- Can one-off labs users receive LifeScore, recommendations, or clinician visits?
- Are supplement recommendations purchasable in-app, in-store only, or deferred until after clinician review?
- Which ULC services can be recommended before a clinician visit?
- What blood draw booking status/date data can Lifeforce receive from ULC/Kite?

Risky changes or assumptions:
- This entry intentionally does not rework the operational state model yet.
- The next iteration should remove unsupported states and speculative modules before MVP review.
