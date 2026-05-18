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
  ('00000000-0000-4000-8000-000000000001', 'ulc-lifeforce', 'Non-member and one-off labs', 'ULC', 'Should the non-member/no-labs primary CTA be Explore Membership, Schedule Blood Draw, or Book Longevity Assessment?'),
  ('00000000-0000-4000-8000-000000000002', 'ulc-lifeforce', 'Non-member and one-off labs', 'ULC', 'What exactly is included for labs-no-member / one-off labs users?'),
  ('00000000-0000-4000-8000-000000000003', 'ulc-lifeforce', 'Non-member and one-off labs', 'ULC', 'Do one-off labs users receive LifeScore, recommendations, or a clinician visit?'),
  ('00000000-0000-4000-8000-000000000004', 'ulc-lifeforce', 'Products, supplements, and services', 'ULC', 'Are supplements purchasable in-app or in-store only?'),
  ('00000000-0000-4000-8000-000000000005', 'ulc-lifeforce', 'Products, supplements, and services', 'ULC', 'Should supplement recommendations appear before clinician visit, or wait until post-visit care plan?'),
  ('00000000-0000-4000-8000-000000000006', 'ulc-lifeforce', 'Products, supplements, and services', 'ULC', 'Which ULC services can be recommended before clinician review, and which biomarkers trigger them?'),
  ('00000000-0000-4000-8000-000000000007', 'ulc-lifeforce', 'Blood draw and questionnaire data', 'ULC', 'What blood draw booking status/date data can Lifeforce receive from ULC/Kite?'),
  ('00000000-0000-4000-8000-000000000008', 'ulc-lifeforce', 'Blood draw and questionnaire data', 'ULC', 'Should the completed Health Questionnaire state be shown, or should it disappear after completion?')
on conflict (id) do nothing;
