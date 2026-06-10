# ULC x Lifeforce Prototype Spec

## Purpose

This coded prototype explores how the Lifeforce-powered Labs experience can live inside the Ultimate Longevity Center mobile app. It is intended for stakeholder review of the Labs tab dashboard, blood draw status states, lab reports, LifeScore, recommendations, documents, and review feedback.

The current prototype direction is v0.7: a simplified V0 state model based on blood draw and results status rather than member vs non-member segmentation.

Detailed screen-state requirements live in:

- [Labs tab screen states spec](./labs-tab-screen-states-spec.md)

## Current Prototype Version

Visible prototype label:

- v0.7 · V0 state simplification

Current design direction:

- Collapse early member/non-member/one-off-labs states into a universal No Labs Performed state.
- Use Schedule Blood Draw as the primary blood draw terminology.
- Hide Health Questionnaire until a blood draw is scheduled.
- Allow View Results when results are back even if Health Questionnaire is incomplete.
- Show LifeScore only when results are back and Health Questionnaire is complete.
- Make Schedule Clinician Visit the primary post-results action.
- Treat post-clinician recommendations as the active care plan.
- Split post-clinician recommendations into prescriptions, supplements, and ULC services/modalities.
- Put broad product browsing on hold for V0.

## Current Dashboard States

1. No Labs Performed
2. Blood Draw Scheduled / Not Completed
3. Labs Processing · Questionnaire Incomplete
4. Labs Processing · Questionnaire Complete
5. Results Back · Questionnaire Incomplete
6. Results Back · Questionnaire Complete
7. Post-Clinician Visit / Care Plan Active

## Supporting Screens

- Lab reports listing
- Lab reports empty state
- Lab report detail
- Biomarker detail
- Processing status
- Clinician recommendations
- Prescription detail
- Review order
- Recommendations locked
- Reusable Health Questionnaire states

## Key Product Decisions

- The Labs tab should be organized around operational status: no draw, draw scheduled, labs processing, results back, post-clinician recommendations.
- Lifeforce may not receive ULC/Kite membership status in V0, so membership-dependent screen branching is deferred.
- The no-labs screen should stay minimal and avoid unsupported membership, IV/injectable, documents, and product catalog modules.
- Health Questionnaire should only appear after a blood draw is scheduled because it needs a DX order ID.
- Results should not be blocked by an incomplete Health Questionnaire.
- LifeScore is gated behind results back plus Health Questionnaire complete.
- The post-clinician state should prioritize recommendations at the top.
- Prescription recommendations may deep link to product/detail/cart/subscription if supported.
- Supplement recommendations should use in-center language unless in-app purchase or BOPUS is confirmed.
- ULC services/modalities should use Book CTAs and deep link into service booking if supported.
- Documents are lower-priority utility content and should not compete with recommendations, LifeScore, or lab reports.

## Deep-Link Dependency

Deep linking is the primary V0 blocker. The prototype intentionally keeps the user-facing CTAs visible, but the implementation depends on whether ULC/Kite can route to the right destination.

Highest-priority deep links:

- Schedule Blood Draw
- Manage Blood Draw Booking
- Book Longevity Assessment
- Schedule Clinician Visit
- Book specific ULC service or modality
- Prescription product detail / cart / checkout / subscription
- Lab reports and historical lab reports
- Documents
- LifeScore detail

## Open Questions

Open questions are tracked in the prototype UI and in the detailed Labs tab spec.

Critical question groups:

- Deep-linkable ULC/Kite destinations
- Membership or one-off-lab status availability
- One-off labs entitlements
- Prescription commerce flow and CTA language
- Supplement purchase path: in-app, BOPUS, or in-center only
- ULC services/modalities recommendation rules and deep links
- Documents/upload inclusion for V0
- LifeScore detail page scope

## Supabase Review Tools

The prototype includes collaborative review tools for internal feedback:

- Comments are stored in Supabase table: prototype_comments
- Open Questions are stored in Supabase table: prototype_open_questions
- localStorage is used only to remember the last-entered reviewer initials/name

Frontend environment variables:

- VITE_SUPABASE_URL
- VITE_SUPABASE_ANON_KEY

## Changelog Process

After each meaningful prototype/design round, update:

- CHANGELOG.md
- The visible collapsed changelog at the bottom of the All Screens page
- This spec or the Labs tab screen states spec when state logic changes

Audience note:

- CHANGELOG.md and the visible page changelog should focus on design/prototype changes, not comment-tool or open-question-tool implementation details.
