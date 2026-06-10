# ULC x Lifeforce Labs Tab Module Code Handoff

This handoff maps each prototype screen to the modules/functions that render it.

Primary implementation file:

- `index.html`

Core rendering model:

- Dashboard screen data lives in `variants` around `index.html:2569`.
- Dashboard state composition lives in `dashboardContent(v)` around `index.html:3837`.
- Dashboard shell rendering lives in `renderVariant(v)` around `index.html:3904`.
- Standalone support screens are rendered with `phoneScreen(...)` around `index.html:3933`.

## Shared Dashboard Shell

Every dashboard state is rendered by `renderVariant(v)`.

```js
function renderVariant(v, options = {}) {
  const showIntroTop =
    v.key === "non_member_no_labs" ||
    (v.livePreview && v.userType === "non_member_no_labs");
  const skipTopAction = ["results_questionnaire_incomplete", "results_questionnaire_complete"].includes(v.journeyState);
  const screenId = screenIdForVariant(v);
  const screenTitle = screenTitleForVariant(v);
  const annotations = (options.showDestinations ?? showReviewerCtaDestinations) ? renderCtaDestinations(screenId) : "";
  return `
    <article class="variant ${annotations ? "with-cta-destinations" : ""}">
      <div class="variant-phone-column">
        ${renderVariantLabel(v.label, options.labelNote || "")}
        <div class="phone" data-screen-id="${screenId}" data-screen-title="${escapeHtml(screenTitle)}">
          ${statusBar()}
          <div class="screen" data-screen-id="${screenId}" data-screen-title="${escapeHtml(screenTitle)}">
            ${renderCommentPins(screenId)}
            ${header(v)}
            ${skipTopAction ? "" : actionModule(v)}
            ${showIntroTop ? contextModule(v) : ""}
            ${lowerContent(v)}
          </div>
          ${bottomNav()}
        </div>
      </div>
      ${annotations}
    </article>
  `;
}
```

Shared shell modules:

- `statusBar()`
- `header(v)`
- `actionModule(v, options)`
- `contextModule(v)`
- `lowerContent(v)` delegates to `dashboardContent(v)`
- `bottomNav()`
- `renderCommentPins(screenId)`
- `renderCtaDestinations(screenId)`

## Dashboard Screens

### 01 · No blood draw performed

State key:

- `non_member_no_labs`

Variant data:

- `index.html:2571`

Rendered modules:

- `header(v)`
- `actionModule(v)`
  - Title: `Get your biomarkers tested`
  - CTA: `Schedule Blood Draw`
- `contextModule(v)`
  - Title: `Labs powered by Lifeforce`
  - Includes `Measure → Review → Personalize` via `processRow()`
- `longevityAssessmentCard()`
  - Title: `Longevity Assessment`
  - CTA: `Book Assessment`

Dashboard composition:

```js
if (state === "no_labs_performed" || state === "prospect" || state === "non_member_no_labs") {
  return `
    ${longevityAssessmentCard()}
  `;
}
```

Primary module code:

- `actionModule(v)` at `index.html:3469`
- `contextModule(v)` at `index.html:3306`
- `processRow()` at `index.html:3170`
- `longevityAssessmentCard()` at `index.html:3388`

### 02 · Blood draw scheduled

State key:

- `member_blood_draw_booked`

Variant data:

- `index.html:2586`

Rendered modules:

- `header(v)`
- `actionModule(v)`
  - Title: `Complete your Health Questionnaire`
  - CTA: `Complete Health Questionnaire`
- `bloodDrawBookedCard()`
  - Title: `Blood draw scheduled`
  - CTA: `Manage Booking`

Dashboard composition:

```js
if (state === "blood_draw_booked") {
  return `
    ${bloodDrawBookedCard()}
  `;
}
```

Primary module code:

- `actionModule(v)` at `index.html:3469`
- `bloodDrawBookedCard()` at `index.html:3438`

### 03 · Labs processing · Questionnaire incomplete

State key:

- `member_labs_processing_questionnaire_incomplete`

Variant data:

- `index.html:2601`

Rendered modules:

- `header(v)`
- `actionModule(v)`
  - Title: `Complete your Health Questionnaire`
  - CTA: `Complete Health Questionnaire`
- `labReportsHub(v)`
  - Renders processing status card when `resultsStatus === "labs_processing"`

Reviewer-only note:

- Added in All Screens via `repeatLabsReviewerNote(v)`.

Dashboard composition:

```js
if (state === "labs_processing_questionnaire_incomplete") {
  return `
    ${labReportsHub(v)}
  `;
}
```

Primary module code:

- `actionModule(v)` at `index.html:3469`
- `labReportsHub(v)` at `index.html:3575`
- `repeatLabsReviewerNote(v)` at `index.html:3164`

### 04 · Labs processing · Questionnaire complete

State key:

- `member_labs_processing_questionnaire_complete`

Variant data:

- `index.html:2616`

Rendered modules:

- `header(v)`
- `labReportsHub(v)`
  - Processing status card
- `profileBanner(v.profileState)`
  - Health Questionnaire complete status
- `processingWaitingCard()`
  - Title: `While your results are processing`
  - CTA: `Browse Products`

Reviewer-only note:

- Added in All Screens via `repeatLabsReviewerNote(v)`.

Dashboard composition:

```js
if (state === "labs_processing_questionnaire_complete") {
  return `
    ${labReportsHub(v)}
    ${profileBanner(v.profileState)}
    ${processingWaitingCard()}
  `;
}
```

Primary module code:

- `labReportsHub(v)` at `index.html:3575`
- `profileBanner(state, options)` at `index.html:3484`
- `processingWaitingCard()` at `index.html:3648`
- `repeatLabsReviewerNote(v)` at `index.html:3164`

### 05 · Results back · Questionnaire incomplete

State key:

- `member_results_questionnaire_incomplete`

Variant data:

- `index.html:2627`

Rendered modules:

- `header(v)`
- `clinicianVisitPrompt({ questionnaireIncomplete: true })`
  - CTA: `Schedule Clinician Visit`
- `actionModule(...)`
  - Title: `Complete your Health Questionnaire`
  - CTA: `Complete Health Questionnaire`
- `labReportsHub(v)`
  - CTA: `View Results`
  - Link: `View Lab History`
- `documentCard()`
  - CTA: `View Documents`

Dashboard composition:

```js
if (state === "results_questionnaire_incomplete") {
  return `
    ${clinicianVisitPrompt({ questionnaireIncomplete: true })}
    ${actionModule({ ...v, actionCopy: "Complete your questionnaire before your visit so your clinician has the context they need." }, { subtleCta: true })}
    ${labReportsHub(v)}
    ${documentCard()}
  `;
}
```

Primary module code:

- `clinicianVisitPrompt(...)` at `index.html:3424`
- `actionModule(v, options)` at `index.html:3469`
- `labReportsHub(v)` at `index.html:3575`
- `documentCard()` at `index.html:3633`

### 06 · Results back · Questionnaire complete

State key:

- `member_results_questionnaire_complete`

Variant data:

- `index.html:2641`

Rendered modules:

- `header(v)`
- `clinicianVisitPrompt()`
  - CTA: `Schedule Clinician Visit`
- `labReportsHub(v)`
  - CTA: `View Results`
  - Link: `View Lab History`
- `lifeScoreCard(false)`
  - CTA: `Dive Deeper`
- `documentCard()`
  - CTA: `View Documents`

Dashboard composition:

```js
if (state === "results_questionnaire_complete") {
  return `
    ${clinicianVisitPrompt()}
    ${labReportsHub(v)}
    ${lifeScoreCard(false)}
    ${documentCard()}
  `;
}
```

Primary module code:

- `clinicianVisitPrompt(...)` at `index.html:3424`
- `labReportsHub(v)` at `index.html:3575`
- `lifeScoreCard(locked)` at `index.html:3398`
- `lifeScoreSupportingMetrics()` at `index.html:3250`
- `documentCard()` at `index.html:3633`

### 07 · Post-clinician visit · Recommendations active

State key:

- `member_care_plan_active`

Variant data:

- `index.html:2651`

Rendered modules:

- `header(v)`
- `clinicianRecommendations()`
  - Prescription Recommendations
  - Supplement Recommendations
  - Recommended Services
- `lifeScoreCard(false)`
- `labReportsHub(v)`
- `documentCard()`

Dashboard composition:

```js
if (state === "post_clinician_recommendations_active") {
  return `
    ${clinicianRecommendations()}
    ${lifeScoreCard(false)}
    ${labReportsHub(v)}
    ${documentCard()}
  `;
}
```

Primary module code:

- `clinicianRecommendations()` at `index.html:3764`
- `lifeScoreCard(locked)` at `index.html:3398`
- `labReportsHub(v)` at `index.html:3575`
- `documentCard()` at `index.html:3633`

## Supporting Screens

### 08 · Lab Reports

Screen function:

- `labReportsListing()` at `index.html:3994`

Rendered modules:

- `titleBar("Lab Reports", "Lifeforce Blood Panels", "plus")`
- `reportCard(...)` for:
  - Jun 9, 2026 · Latest
  - Apr 14, 2026
  - Mar 12, 2026

Primary module code:

- `reportCard({ date, latest, counts, status, muted })` at `index.html:3971`
- `labReportsListing()` at `index.html:3994`

### 09 · Lab Report Detail

Screen function:

- `labReportDetail()` at `index.html:4101`

Rendered modules:

- Screen titlebar: `Lifeforce Lab Results`
- Clinician Summary card
- Result Summary card
  - Summary tiles filter biomarker list by range
- Biomarkers card
  - `biomarkerFilterBar()`
  - `biomarkerListByRange()`
- Utility CTA:
  - `Download Lab Report`

Primary module/data code:

- `biomarkers` data at `index.html:4007`
- `biomarkerRangeGroups` at `index.html:4014`
- `biomarkerCategories` at `index.html:4020`
- `orderedBiomarkers()` at `index.html:4033`
- `rangeBar(b)` at `index.html:4041`
- `biomarkerRow(b)` at `index.html:4049`
- `biomarkerFilterBar()` at `index.html:4069`
- `biomarkerListByRange()` at `index.html:4085`
- `labReportDetail()` at `index.html:4101`

### 10 · Biomarker Detail

Screen function:

- `biomarkerDetail()` at `index.html:4141`

Rendered modules:

- Screen titlebar: `LDL Cholesterol`
- Hero value card
  - Current value: `168 mg/dL`
  - Status: `Out of Range · High`
  - Range bar
- Clinician discussion note
- History over time card
- What this means education card

Primary module code:

- `biomarkerDetail()` at `index.html:4141`
- `rangeBar(b)` at `index.html:4041`

### 11 · LifeScore

Screen function:

- `lifeScoreDetailPage()` at `index.html:4179`

Rendered modules:

- LifeScore hero
- Quality of Life card
- Longevity Risk card
- Biological Age card
- How LifeScore is calculated card

Primary module code:

- `lifeScoreDetailPage()` at `index.html:4179`
- `lifeScoreHeart(size)` at `index.html:3213`
- `lifeScoreSupportingMetrics()` at `index.html:3250`
- `qualityStars()` at `index.html:3215`
- `riskBars()` at `index.html:3219`

### 12 · Documents

Screen function:

- `documentsPage()` at `index.html:4219`

Rendered modules:

- Titlebar: `Documents`
- Lifestyle Resources section
- Clinician Notes section
- Lab Results section
- Uploads card

Primary module code:

- `documentsPage()` at `index.html:4219`

### 13A · Prescription Detail · Needs review

Screen function:

- `productDetailPage()` at `index.html:4267`

Rendered modules:

- Product hero card
- Recommendation rationale card
- Related results card
- Sticky purchase CTA

Primary module code:

- `productDetailPage()` at `index.html:4267`

### 13B · Review Order · Needs review

Screen function:

- `orderReviewPage()` at `index.html:4308`

Rendered modules:

- Prescription selected card
- Shipping + payment card
- Sticky order CTA

Primary module code:

- `orderReviewPage()` at `index.html:4308`

## Reusable Module Function Index

Dashboard/orchestration:

- `variants`: dashboard state data, `index.html:2569`
- `dashboardContent(v)`: state-to-module composition, `index.html:3837`
- `renderVariant(v)`: dashboard shell, `index.html:3904`
- `phoneScreen(...)`: support screen shell, `index.html:3933`

Core cards:

- `actionModule(v, options)`: primary dashboard action card, `index.html:3469`
- `contextModule(v)`: Lifeforce orientation card, `index.html:3306`
- `processRow()`: Measure / Review / Personalize row, `index.html:3170`
- `profileBanner(state, options)`: Health Questionnaire state card, `index.html:3484`
- `bloodDrawBookedCard()`: scheduled blood draw card, `index.html:3438`
- `processingWaitingCard()`: processing-state optional browsing card, `index.html:3648`

Results and documents:

- `labReportsHub(v)`: dashboard lab report/processing/results card, `index.html:3575`
- `reportCard(...)`: lab report list row card, `index.html:3971`
- `documentCard()`: dashboard Documents card, `index.html:3633`
- `documentsPage()`: documents detail screen, `index.html:4219`

LifeScore:

- `lifeScoreCard(locked)`: dashboard LifeScore card, `index.html:3398`
- `lifeScoreDetailPage()`: LifeScore detail screen, `index.html:4179`
- `lifeScoreHeart(size)`: LifeScore mark/visual, `index.html:3213`
- `lifeScoreSupportingMetrics()`: dashboard/detail supporting metrics, `index.html:3250`

Recommendations:

- `clinicianRecommendations()`: post-clinician recommendations module, `index.html:3764`
- `productDetailPage()`: prescription detail support screen, `index.html:4267`
- `orderReviewPage()`: review order support screen, `index.html:4308`

Biomarkers:

- `biomarkers`: biomarker demo data, `index.html:4007`
- `orderedBiomarkers()`: default ordering from Out of Range to Normal to Optimal, `index.html:4033`
- `rangeBar(b)`: range visualization, `index.html:4041`
- `biomarkerRow(b)`: biomarker row card, `index.html:4049`
- `biomarkerFilterBar()`: category and range filters, `index.html:4069`
- `biomarkerListByRange()`: grouped biomarker sections, `index.html:4085`
- `biomarkerDetail()`: biomarker detail screen, `index.html:4141`

Reviewer tooling:

- `ctaDestinationAnnotations`: reviewer-only CTA routing assumptions, `index.html:3055`
- `renderCtaDestinations(screenId)`: annotation rail renderer, `index.html:3114`
- `OPEN_QUESTION_SEEDS`: seeded open questions, `index.html:2734`
- `repeatLabsReviewerNote(v)`: repeat-labs reviewer note on processing states, `index.html:3164`

## Files To Share With Developer

Minimum set:

- `index.html`
- `docs/labs-tab-module-code-handoff.md`
- `docs/labs-tab-screen-states-spec.md`
- `docs/lifeforce-ulc-prototype-spec.md`

Optional but useful:

- `CHANGELOG.md`

If they only need UI implementation guidance, send this handoff plus `index.html`.
