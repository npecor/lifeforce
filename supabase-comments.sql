create table if not exists prototype_comments (
  id uuid primary key default gen_random_uuid(),
  prototype_id text not null default 'ulc-lifeforce',
  screen_id text not null,
  screen_title text not null,
  state_key text,
  route text,
  x numeric,
  y numeric,
  author text not null,
  text text not null,
  resolved boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table prototype_comments enable row level security;

grant usage on schema public to anon;
grant select, insert, update, delete on table prototype_comments to anon;

drop policy if exists "Allow anonymous read" on prototype_comments;
create policy "Allow anonymous read"
on prototype_comments
for select
to anon
using (prototype_id = 'ulc-lifeforce');

drop policy if exists "Allow anonymous insert" on prototype_comments;
create policy "Allow anonymous insert"
on prototype_comments
for insert
to anon
with check (prototype_id = 'ulc-lifeforce');

drop policy if exists "Allow anonymous update" on prototype_comments;
create policy "Allow anonymous update"
on prototype_comments
for update
to anon
using (prototype_id = 'ulc-lifeforce')
with check (prototype_id = 'ulc-lifeforce');

drop policy if exists "Allow anonymous delete" on prototype_comments;
create policy "Allow anonymous delete"
on prototype_comments
for delete
to anon
using (prototype_id = 'ulc-lifeforce');

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create table if not exists public.prototype_open_questions (
  id uuid primary key default gen_random_uuid(),
  prototype_id text not null default 'ulc-lifeforce',
  category text not null,
  author text not null,
  text text not null,
  resolved boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.prototype_open_questions enable row level security;

grant select, insert, update, delete on table public.prototype_open_questions to anon;

drop policy if exists "Allow anonymous read open questions" on public.prototype_open_questions;
create policy "Allow anonymous read open questions"
on public.prototype_open_questions
for select
to anon
using (prototype_id = 'ulc-lifeforce');

drop policy if exists "Allow anonymous insert open questions" on public.prototype_open_questions;
create policy "Allow anonymous insert open questions"
on public.prototype_open_questions
for insert
to anon
with check (prototype_id = 'ulc-lifeforce');

drop policy if exists "Allow anonymous update open questions" on public.prototype_open_questions;
create policy "Allow anonymous update open questions"
on public.prototype_open_questions
for update
to anon
using (prototype_id = 'ulc-lifeforce')
with check (prototype_id = 'ulc-lifeforce');

drop policy if exists "Allow anonymous delete open questions" on public.prototype_open_questions;
create policy "Allow anonymous delete open questions"
on public.prototype_open_questions
for delete
to anon
using (prototype_id = 'ulc-lifeforce');

drop trigger if exists set_prototype_open_questions_updated_at on public.prototype_open_questions;
create trigger set_prototype_open_questions_updated_at
before update on public.prototype_open_questions
for each row
execute function public.set_updated_at();

insert into public.prototype_open_questions (id, prototype_id, category, author, text)
values
  ('00000000-0000-4000-8000-000000000001', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Which CTAs are deep-linkable from the Lifeforce embedded view?'),
  ('00000000-0000-4000-8000-000000000002', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Can we deep link into specific services, or only the Book tab?'),
  ('00000000-0000-4000-8000-000000000003', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Can we deep link to Schedule Blood Draw, Manage Booking, and Schedule Clinician Visit?'),
  ('00000000-0000-4000-8000-000000000004', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Can we deep link to prescription product detail, cart, or checkout?'),
  ('00000000-0000-4000-8000-000000000005', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Can we deep link to specific ULC services like Hyperbaric Oxygen Therapy?'),
  ('00000000-0000-4000-8000-000000000006', 'ulc-lifeforce', 'Membership / state logic', 'ULC', 'Does it make sense to mention Lifeforce membership in the embedded view?'),
  ('00000000-0000-4000-8000-000000000007', 'ulc-lifeforce', 'Membership / state logic', 'ULC', 'Will Lifeforce have access to ULC membership status?'),
  ('00000000-0000-4000-8000-000000000008', 'ulc-lifeforce', 'Membership / state logic', 'ULC', 'If membership status is unavailable, can it be inferred from purchase or subscription webhooks?'),
  ('00000000-0000-4000-8000-000000000009', 'ulc-lifeforce', 'Membership / state logic', 'ULC', 'Should no-labs member and no-labs non-member use the same V0 screen?'),
  ('00000000-0000-4000-8000-000000000010', 'ulc-lifeforce', 'Products / supplements', 'ULC', 'What will the supplement buying process look like near-term?'),
  ('00000000-0000-4000-8000-000000000011', 'ulc-lifeforce', 'Products / supplements', 'ULC', 'Are supplements purchasable in-app, BOPUS, or in-store only?'),
  ('00000000-0000-4000-8000-000000000012', 'ulc-lifeforce', 'Products / supplements', 'ULC', 'Should supplements display as Available at ULC?'),
  ('00000000-0000-4000-8000-000000000013', 'ulc-lifeforce', 'Products / supplements', 'ULC', 'Should recommended supplements appear pre-clinician, post-clinician only, or both?'),
  ('00000000-0000-4000-8000-000000000014', 'ulc-lifeforce', 'Products / supplements', 'ULC', 'Which Lifeforce supplements should be recommended vs ULC-owned SKUs?'),
  ('00000000-0000-4000-8000-000000000015', 'ulc-lifeforce', 'Services / modalities', 'ULC', 'Which ULC services can be recommended?'),
  ('00000000-0000-4000-8000-000000000016', 'ulc-lifeforce', 'Services / modalities', 'ULC', 'Which biomarkers trigger service recommendations?'),
  ('00000000-0000-4000-8000-000000000017', 'ulc-lifeforce', 'Services / modalities', 'ULC', 'Do we need images for services like Red Light Therapy and Hyperbaric Oxygen Therapy?'),
  ('00000000-0000-4000-8000-000000000018', 'ulc-lifeforce', 'Services / modalities', 'ULC', 'Will ULC/Kite provide service imagery via API, or should Lifeforce store static assets?'),
  ('00000000-0000-4000-8000-000000000019', 'ulc-lifeforce', 'Blood draw and questionnaire data', 'ULC', 'What scheduled, processing, or completed blood draw status data can Lifeforce receive from ULC/Kite?'),
  ('00000000-0000-4000-8000-000000000020', 'ulc-lifeforce', 'Blood draw and questionnaire data', 'ULC', 'Can the embedded view receive blood draw date/time, or only a booked/scheduled status?'),
  ('00000000-0000-4000-8000-000000000021', 'ulc-lifeforce', 'Documents', 'ULC', 'Should Documents be included in V0?'),
  ('00000000-0000-4000-8000-000000000022', 'ulc-lifeforce', 'Documents', 'ULC', 'Does upload belong in V0?'),
  ('00000000-0000-4000-8000-000000000023', 'ulc-lifeforce', 'Documents', 'ULC', 'Which documents should be shown: lab PDFs, requisitions, clinician notes, or upload requests?'),
  ('00000000-0000-4000-8000-000000000024', 'ulc-lifeforce', 'LifeScore', 'ULC', 'What should be shown on the LifeScore detail page for V0?'),
  ('00000000-0000-4000-8000-000000000025', 'ulc-lifeforce', 'LifeScore', 'ULC', 'Should we include biological age, quality of life, and longevity risk in the dashboard card?'),
  ('00000000-0000-4000-8000-000000000026', 'ulc-lifeforce', 'Recommendations and next steps', 'ULC', 'Do we have a formal Care Plan concept/object in the ULC/Lifeforce experience, or should we refer only to clinician recommendations and next steps?')
on conflict (id) do update set
  category = excluded.category,
  author = excluded.author,
  text = excluded.text,
  updated_at = now();
