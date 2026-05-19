# ULC x Lifeforce Prototype Handoff

This folder contains the shareable handoff for:

- Collaborative commenting
- Collaborative open questions
- Prototype tracked changes / visible changelog

## Files

- `commenting-and-tracked-changes.patch`

This is a git patch series containing the implementation commits for the review tooling and tracked-change support.

## What Is Included

### Collaborative comments

- Supabase-backed comments, shared across users/devices.
- No login required.
- Reviewer initials/name entered manually.
- Comment Mode defaults on.
- Comment Mode on: click screens to place pinned comments.
- Comment Mode off: prototype interactions work normally.
- Pins can be dragged to reposition.
- Comments can be resolved, unresolved, deleted, and exported.
- Comments are grouped by screen in the panel.

### Collaborative open questions

- Supabase-backed open questions, shared across users/devices.
- Add open question with initials/name, category, and text.
- Filter by Open / Resolved / All.
- Resolve, unresolve, and delete questions.
- Existing MVP open questions are seeded through SQL.
- If Supabase setup is missing, the prototype shows read-only default questions instead of a raw error.

### Tracked changes

- Visible prototype version label.
- Collapsible prototype changelog at the bottom of All Screens.
- `CHANGELOG.md` for repo-level tracking.
- Changelog is intentionally focused on design/prototype changes, not review-tool implementation details.
- Product spec updates in `docs/lifeforce-ulc-prototype-spec.md`.

## Supabase Setup

Run the updated SQL file in Supabase:

`supabase-comments.sql`

It creates:

- `prototype_comments`
- `prototype_open_questions`
- Anonymous read/insert/update/delete RLS policies
- `set_updated_at()` helper
- Open question seed rows

The frontend uses these environment variables:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

Do not use a Supabase secret key in the frontend.

## Implementation Files In The Repo

- `index.html`
- `api/config.js`
- `supabase-comments.sql`
- `CHANGELOG.md`
- `docs/lifeforce-ulc-prototype-spec.md`

## Included Commit Patches

- `d6791ce` Add collaborative Supabase comments
- `d872ce8` Update Supabase comments SQL
- `c3ce079` Add v0.2 prototype change tracking
- `6724f77` Refine comment mode interaction
- `0df492b` Restore comment pin dragging
- `0ec0d1e` Fix comment overlay filtering
- `92150a5` Add collaborative open questions
- `cf37891` Remove screen label comment badges
- `55aa94a` Add open questions setup fallback
- `aad881c` Keep changelog focused on prototype changes
- `0e23db3` Default comment mode on

## How To Apply The Patch

From another git repo with a compatible prototype baseline:

```bash
git am commenting-and-tracked-changes.patch
```

If the receiving repo has drifted, inspect the patch manually or apply sections into the relevant files.

