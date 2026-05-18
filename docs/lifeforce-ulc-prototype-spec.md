# ULC x LifeForce Prototype Spec

## Purpose

This coded prototype explores how the LifeForce experience can live inside the Ultimate Longevity Center mobile app. It is intended for stakeholder review of state-based dashboard logic, lab reports, result detail, recommendations, products, and collaborative feedback.

This file records the current pre-MVP baseline before the May 15 meeting-driven state model rework.

## Snapshot Baseline

Snapshot label: v0.2 · Pre-MVP state update

Recoverable checkpoint: snapshot-before-mvp-state-rework

Use this snapshot as the revert point if the next round of MVP state-model changes goes in the wrong direction.

## Current Supported Prototype States

Current dashboard states in the pre-MVP prototype:

- Non-member · No labs
- Member · No labs
- Member · Labs processing
- Results back · Questionnaire incomplete
- Results back · Questionnaire complete
- Care plan active
- Time for next draw

Current supporting flows:

- Lab reports listing
- Lab reports empty state
- Lab report detail
- Biomarker detail
- Processing labs state
- Recommendations
- Product browse
- Product detail
- Review order
- Recommendations locked
- Reusable Health Questionnaire states

## Current Product Decisions

- The LifeForce area is framed as a broader ULC longevity journey rather than only a Labs tab.
- The bottom nav remains ULC-native: Home, Book, Schedule, Labs, Account.
- The prototype includes collaborative comments through Supabase.
- Comments are shared across users/devices and do not require login.
- Comment author initials/name are remembered locally, but comment content is stored in Supabase.
- The current pre-MVP state model still includes states and modules that may be removed or renamed in the next pass.

## May 15 MVP Direction To Apply Next

The next round of design changes should simplify the LifeForce section around the operational journey:

Orient -> Schedule blood draw -> Complete Health Questionnaire -> View results -> Schedule clinician visit -> Review recommendations / care plan

Planned state model:

- Non-member · No labs
- Labs · No member / one-off labs
- Member · No labs · blood draw not scheduled
- Member · Blood draw booked · draw not completed
- Member · Labs processing · questionnaire incomplete
- Member · Labs processing · questionnaire complete
- Member · Results back · questionnaire incomplete
- Member · Results back · questionnaire complete
- Member · Post-clinician visit / care plan active

Planned removals or de-emphasis:

- Time for next blood draw
- Questionnaire update required
- Questionnaire update recommended
- View questionnaire answers
- Membership management inside the embedded LifeForce view
- Future blood draw cadence / eligibility logic

## Key Open Questions

LifeForce positioning:

- What is the approved copy for introducing LifeForce inside ULC?
- How should the non-member/no-labs page merchandise LifeForce?
- Is Your Longevity Journey / Powered by LifeForce still the preferred header?

Non-member primary action:

- Should non-member/no-labs primary CTA be Explore Membership, Schedule Blood Draw, or Book Longevity Assessment?
- How important is Longevity Assessment for launch?

One-off labs / labs-no-member:

- What exactly can labs-no-member users do?
- Do they receive LifeScore?
- Do they receive recommendations?
- Do they schedule a clinician visit?
- Is this V0 or later?

Health Questionnaire:

- Should the questionnaire be hidden completely until blood draw is booked?
- What should a completed state show if users cannot view answers?

Blood draw booking:

- What exact status can LifeForce receive after the draw is booked?
- Can the prototype show dates and expected draw timing, or only "booked"?
- What is the deep-link destination for manage booking?

Supplements:

- Are supplements purchasable in-app?
- Are supplements in-store only?
- Should supplement recommendations show before clinician visit?
- If in-store only, should supplement recommendations wait until the in-center clinician visit?

ULC service recommendations:

- Which ULC services/modalities will be recommended?
- Are any safe to recommend automatically from biomarker thresholds before clinician visit?
- Which biomarkers map to which services?

Rx recommendations:

- Which Rx products should appear in the post-clinician care plan?
- What is the correct CTA/deep link for purchase?

Membership management:

- Where exactly in the ULC app is clinical membership displayed or managed?
- Should the LifeForce section link to it at all, or avoid it entirely?

Future blood draws:

- How will ULC lifecycle communications prompt next draw?
- Can LifeForce ever know eligibility/cadence?
- Should LifeForce show a future draw module, or only previous/in-progress draws?

## Supabase Collaborative Comments

Comments use Supabase table: prototype_comments

Frontend environment variables:

- VITE_SUPABASE_URL
- VITE_SUPABASE_ANON_KEY

Persistence rules:

- Comments are stored in Supabase.
- localStorage is used only for the last-entered reviewer initials/name.

Supported comment actions:

- Add comment
- View comments grouped by screen
- View screen from comment
- Resolve/unresolve
- Delete
- Export all comments
- Drag pinned comment markers to update location

## Changelog Process

After each meaningful round of changes, update:

- CHANGELOG.md
- The visible collapsed changelog at the bottom of the All Screens page
- This spec, if product decisions or supported states change
