# ULC x LifeForce Prototype Changelog

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
- Should order review keep the secondary Keep Browsing action in the bottom bar, or move it inline as a text link?

Risky changes or assumptions:
- Purchase bars are treated as prototype shell/mobile viewport overlays for these screens, not inline content cards.

## v0.4 · Care plan refinement

Date: May 18, 2026

Summary:
- Simplifies the post-clinician visit / care plan active state.
- Replaces repeated recommendation/product CTAs with one top-level care plan CTA and one prescription product CTA.
- Changes the top care plan CTA to View Care Plan.
- Replaces generic supplement examples with Estradiol Patch and Semaglutide in the post-clinician prescription recommendations module.
- Moves prescription recommendations above LifeScore and Lab Reports.
- Updates the labs/no-member card to use user-facing biomarker testing language and removes TBD chips from the mobile UI.

User states affected:
- Non-member · one-off labs
- Post-clinician visit · Care plan active

Known open questions:
- Should post-clinician product CTA language be Add to Plan, Order Now, or Order Recommended Products?
- Which Rx products and prices are approved for prototype/demo use?
- Where should product ordering deep-link in the main ULC app?

Risky changes or assumptions:
- Estradiol Patch and Semaglutide are used as prototype examples and should be validated by the clinical/product team.
- The care plan state now emphasizes prescription recommendations over supplement recommendations.

## v0.3 · MVP state model pass

Date: May 18, 2026

Summary:
- Updates the prototype toward the May 15 MVP operational journey.
- Adds labs/no-member and blood-draw-booked states.
- Changes blood draw terminology from Book Blood Draw to Schedule Blood Draw.
- Hides Health Questionnaire before blood draw is scheduled.
- Splits labs processing into questionnaire incomplete and questionnaire complete states.
- Allows results access when questionnaire is incomplete while gating LifeScore.
- Renames care plan active to post-clinician visit / care plan active.
- Removes next-draw-due logic from the production-facing state set.
- Removes LifeForce membership management from dashboard states.

User states affected:
- Non-member · No labs
- Non-member · one-off labs
- Member · No labs · draw not scheduled
- Member · Blood draw booked · draw not completed
- Labs processing · questionnaire incomplete
- Labs processing · questionnaire complete
- Results back · questionnaire incomplete
- Results back · questionnaire complete
- Post-clinician visit · Care plan active

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
- What blood draw booking status/date data can LifeForce receive from ULC/Kite?

Risky changes or assumptions:
- This entry intentionally does not rework the operational state model yet.
- The next iteration should remove unsupported states and speculative modules before MVP review.
