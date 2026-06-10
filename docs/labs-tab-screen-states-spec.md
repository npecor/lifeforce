# ULC Labs / Lifeforce Tab Screen States Spec

## Purpose

This spec defines the simplified V0 screen-state model for the ULC Labs tab with embedded Lifeforce content.

The V0 experience should be organized around blood draw and results status rather than member vs non-member status. Lifeforce may not receive reliable membership state from ULC/Kite at launch, so the safest model is:

No blood draw performed -> blood draw scheduled or processing -> results back -> clinician visit -> post-clinician recommendations.

## V0 Principles

- Orient users to what the Labs/Lifeforce area does.
- Route users into ULC/Kite flows through clear CTAs.
- Avoid unsupported membership-management, cadence, and product-catalog assumptions.
- Keep Health Questionnaire hidden until a blood draw is scheduled because it needs a DX order ID.
- Allow users to view results when results are back, even if the Health Questionnaire is incomplete.
- Show LifeScore only when results are back and the Health Questionnaire is complete.
- Treat the post-clinician screen as clinician recommendations and next steps, not a confirmed care-plan object.
- Track deep-link dependencies as open questions until ULC/Kite destinations are confirmed.

## V0 State Model

1. No Blood Draw Performed
2. Blood Draw Scheduled · Questionnaire Not Started
3. Labs Processing · Questionnaire Incomplete
4. Labs Processing · Questionnaire Complete
5. Results Back · Questionnaire Incomplete
6. Results Back · Questionnaire Complete
7. Post-Clinician Visit / Recommendations Active

Optional or unresolved:

- One-off labs may collapse into No Blood Draw Performed until purchase/status data is available.
- Membership segmentation should remain deferred unless ULC/Kite passes status to Lifeforce.

## State Details

### 1. No Blood Draw Performed

Purpose:

- Orient, inventory, and wayfind.
- Explain what users can do from this Labs area.
- Keep the screen minimal until deep links and membership/lab-purchase status are confirmed.

Primary modules:

- Labs powered by Lifeforce
- Get your biomarkers tested

Primary CTA:

- Schedule Blood Draw

Secondary CTA:

- Book Longevity Assessment, if ULC wants to promote it here and it is deep-linkable.

Remove or defer:

- Health Questionnaire
- LifeScore
- Lab results
- Personalized recommendations
- Detailed membership inclusions
- IV / injectable CTAs
- Broad product browsing
- Documents
- Membership management

User-facing copy direction:

Get your biomarkers tested

Begin with a Lifeforce blood panel. Clinical membership unlocks LifeScore, clinician review, and personalized recommendations.

### 2. Blood Draw Scheduled · Questionnaire Not Started

Purpose:

- Confirm the draw is scheduled.
- Make Health Questionnaire the primary action.

Primary module:

- Complete your Health Questionnaire
- Complete this before your results review so your clinician has the context they need.

Primary CTA:

- Complete Health Questionnaire

Secondary module:

- Blood draw scheduled
- Manage or update your booking details anytime.

Secondary CTA:

- Manage Booking

Notes:

- Avoid referencing implementation boundaries around the ULC app.
- Do not show date/time unless Lifeforce receives reliable scheduling details.

### 3. Labs Processing · Questionnaire Incomplete

Purpose:

- Push Health Questionnaire while labs are processing.

Primary module:

- Complete your Health Questionnaire
- Your bloodwork is processing. Complete your questionnaire while Lifeforce reviews your panel.

Primary CTA:

- Complete Health Questionnaire

Secondary module:

- Bloodwork processing
- Your Lifeforce blood panel is being processed. Results will appear after review.

Do not show:

- Schedule Clinician Visit
- LifeScore
- Final recommendations

### 4. Labs Processing · Questionnaire Complete

Purpose:

- Set expectations. It is acceptable if there is little for the user to do.

Primary module:

- Bloodwork processing
- Your Lifeforce blood panel is being processed. Results will appear after review.

Optional:

- A quiet Health Questionnaire complete confirmation.

Do not show:

- Schedule Clinician Visit
- LifeScore
- Final recommendations

### 5. Results Back · Questionnaire Incomplete

Purpose:

- Let users view results.
- Push Health Questionnaire completion.
- Allow clinician visit scheduling, but explain that questionnaire completion helps the clinician prepare.

Primary module:

- Complete your Health Questionnaire
- Your results are back. Complete your questionnaire so your clinician has the context they need.

Primary CTA:

- Complete Health Questionnaire

Secondary modules:

- Lab Reports / Latest Lab Results
- Schedule your clinician visit

Secondary CTAs:

- View Results
- View Lab History
- Schedule Clinician Visit

Do not show:

- LifeScore
- Final clinician recommendations
- Final personalized recommendations

### 6. Results Back · Questionnaire Complete

Purpose:

- Show LifeScore and lab results.
- Drive clinician visit scheduling.

Modules:

- LifeScore
- Lab Reports / Latest Lab Results
- Schedule your clinician visit

Primary CTA:

- Schedule Clinician Visit

Secondary CTAs:

- Dive Deeper
- View Results
- View Lab History

### 7. Post-Clinician Visit / Recommendations Active

Purpose:

- Drive action on clinician recommendations.
- Treat the screen as clinician recommendations and next steps.

Recommended order:

1. Clinician Recommendations
2. LifeScore
3. Lab Reports / latest clinician write-up
4. Documents

Do not use a generic top-level care-plan CTA because a formal care-plan destination is not confirmed.

Recommendation sections:

- Prescription Recommendations
- Supplement Recommendations
- Recommended Services

Prescription examples:

- Estradiol Patch · Hormone support · $110/mo
- Semaglutide · Metabolic support · $270/mo

Prescription CTA options pending deep-link support:

- Buy
- Add to Cart
- Order
- View Details

Supplement examples:

- Vitamin D + K
- Peak Healthspan

Supplement language:

- Recommended by your clinician.
- Available at ULC.

Avoid plan-based supplement CTAs or in-app purchase language unless supplement purchase/BOPUS is confirmed.

Service/modality examples:

- Hyperbaric Oxygen Therapy
- Red Light Therapy

Service CTA:

- Book

## Supporting Screens

### Lab Reports

Dashboard lab card should show:

- Latest report date
- Counts: Optimal / Monitor / Attention
- CTA: View Results
- Secondary CTA: View Lab History

### Lab Report Detail

Include:

- Clinician name
- Optional clinician photo when available
- Clinician note/write-up
- Result summary
- Biomarker detail list

### LifeScore

Show only when:

- Results are back
- Health Questionnaire is complete

LifeScore detail can be simple in V0:

- Score
- What it means
- Quality of Life
- Longevity Risk
- Biological Age
- Explanation of how LifeScore is calculated

### Documents

Documents should be lower priority than recommendations, LifeScore, and lab reports.

Include if supported:

- Lab PDFs
- Requisitions
- Clinician notes
- Uploaded/requested documents
- Upload entry point

### Product Catalog

Broad product browsing is deferred for V0.

Keep focus on recommendation-driven products and services, not a duplicate product catalog.

### Follow-up Health Questionnaire

For repeat blood draws, distinguish the shorter follow-up task from the initial questionnaire:

- Follow-up Health Questionnaire
- Update your health information before your next results review.
- CTA: Complete Follow-up Questionnaire

This is captured as a future/returning-user variation, not a core V0 dashboard state.

## Deep-Link Inventory

Booking / scheduling:

- Schedule Blood Draw
- Manage Blood Draw Booking
- Book Longevity Assessment
- Schedule Clinician Visit
- Book a specific ULC service or modality
- Book tab / service list fallback

Products / commerce:

- Prescription product detail
- Add prescription product to cart
- Buy / order prescription product
- Checkout
- Supplement detail, if any
- Supplement purchase / BOPUS, if supported
- In-center supplement purchase fallback

Results / documents:

- Lab reports
- Historical lab reports
- Lab report detail
- Documents
- Upload document
- Clinician notes / report PDFs
- LifeScore detail

State logic:

- Membership status, if available
- One-off lab purchase status, if available
- Blood draw scheduled status
- Blood draw processing status
- Results back status
- Health Questionnaire status
- Clinician visit completed / recommendations active status

## Deferred / Removed For V0

- Membership management inside the embedded Lifeforce view
- Detailed membership inclusions
- Future blood draw cadence or next-draw-due modules
- Broad product catalog
- Early IV / injectable merchandising CTA
- Health Questionnaire before blood draw is scheduled
- Questionnaire update required / update recommended
- View questionnaire answers
- Final recommendations before results and clinical review
- Supplement in-app purchase CTAs unless purchase path is confirmed

## Open Questions

### CTA destinations / deep linking

- Which CTAs can deep link from the Lifeforce Labs tab into ULC/Kite flows, and can we deep link into specific services/products or only top-level tabs?

### Membership / state logic

- Will Lifeforce receive membership, subscription, or purchase status, and should member/non-member/no-labs users see different screens?
- How should we refer to membership inside the ULC app?

### Supplements / products / services

- What will the supplement and prescription purchase flow look like at launch vs later?
- Which ULC services and supplements can appear as clinician recommendations, and which require clinician review?
- Will ULC/Kite provide product and service images?

### Parking lot

- What blood draw booking, appointment, lab processing, and questionnaire status data can Lifeforce receive from ULC/Kite?
