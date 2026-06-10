# ULC x Lifeforce Prototype Spec

## Purpose

This coded prototype explores how the Lifeforce-powered Labs experience can live inside the Ultimate Longevity Center mobile app. It is intended for stakeholder review of the Labs tab dashboard, blood draw status states, lab reports, LifeScore, recommendations, documents, and review feedback.

The current prototype direction is v0.8: a simplified V0 state model with June 09 review refinements for LifeScore, Documents, recommendations, and screen numbering.

Detailed screen-state requirements live in:

- [Labs tab screen states spec](./labs-tab-screen-states-spec.md)

## Current Prototype Version

Visible prototype label:

- v0.8 · June 09 review refinements

Current design direction:

- Collapse early member/non-member/one-off-labs states into a universal No Blood Draw Performed state.
- Use Schedule Blood Draw as the primary blood draw terminology.
- Hide Health Questionnaire until a blood draw is scheduled.
- Allow View Results when results are back even if Health Questionnaire is incomplete.
- Show LifeScore only when results are back and Health Questionnaire is complete.
- Make Schedule Clinician Visit the primary post-results action.
- Treat the post-clinician screen as clinician recommendations and next steps, not a confirmed care-plan object.
- Split post-clinician recommendations into prescriptions, supplements, and recommended ULC services.
- Make LifeScore cards more substantive with Quality of Life, Longevity Risk, and Biological Age.
- Add dedicated LifeScore and Documents screens.
- Put broad product browsing on hold for V0.

## Current Dashboard States

1. No Blood Draw Performed
2. Blood Draw Scheduled · Questionnaire Not Started
3. Labs Processing · Questionnaire Incomplete
4. Labs Processing · Questionnaire Complete
5. Results Back · Questionnaire Incomplete
6. Results Back · Questionnaire Complete
7. Post-Clinician Visit / Recommendations Active

## Supporting Screens

- Lab reports listing
- Lab report detail
- Biomarker detail
- LifeScore detail
- Documents
- Clinician Recommendations · Needs review
- Prescription detail · Needs review
- Review order · Needs review
- Recommendations locked · Needs review
- Reusable Health Questionnaire states

## Key Product Decisions

- The Labs tab should be organized around operational status: no draw, draw scheduled, labs processing, results back, post-clinician recommendations.
- Lifeforce may not receive ULC/Kite membership status in V0, so membership-dependent screen branching is deferred.
- The no-blood-draw screen should stay minimal and avoid unsupported membership, IV/injectable, documents, and product catalog modules.
- Health Questionnaire should only appear after a blood draw is scheduled because it needs a DX order ID.
- Results should not be blocked by an incomplete Health Questionnaire.
- LifeScore is gated behind results back plus Health Questionnaire complete.
- The post-clinician state should prioritize recommendations at the top.
- Prescription recommendations use Buy in the prototype while product/detail/cart/checkout deep links are reviewed.
- Supplement recommendations should use Available at ULC language unless in-app purchase or BOPUS is confirmed.
- ULC services/modalities should use Book CTAs and deep link into service booking if supported.
- Documents are lower-priority utility content and should not compete with recommendations, LifeScore, or lab reports.
- Follow-up Health Questionnaire is captured as a reusable future/returning-user state for repeat blood draws.

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
- Whether ULC/Lifeforce has a formal Care Plan concept/object or should use clinician recommendations and next steps language
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
