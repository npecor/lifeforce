# ULC x Lifeforce Prototype

Static coded prototype for the Lifeforce experience inside the Ultimate Longevity Center mobile app.

Open `index.html` directly or deploy the folder as a static site.

## Collaborative comments

The prototype comments are stored in Supabase. Run `supabase-comments.sql` in your Supabase SQL editor, then set these Vercel environment variables:

- `VITE_SUPABASE_URL`
- `VITE_SUPABASE_ANON_KEY`

The Vercel function at `api/config.js` exposes those values to the browser at runtime. Reviewer initials are remembered locally, but comments are not stored in `localStorage`.
