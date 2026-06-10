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
  ('00000000-0000-4000-8000-000000000001', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Which ULC/Kite destinations are deep-linkable from the embedded Lifeforce Labs view?'),
  ('00000000-0000-4000-8000-000000000002', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Can we deep link to Schedule Blood Draw, Manage Booking, and Schedule Clinician Visit?'),
  ('00000000-0000-4000-8000-000000000003', 'ulc-lifeforce', 'Deep linking', 'ULC', 'Can we deep link to specific ULC service booking, prescription product detail, cart, checkout, documents, and LifeScore detail?'),
  ('00000000-0000-4000-8000-000000000004', 'ulc-lifeforce', 'One-off labs and status', 'ULC', 'Can Lifeforce receive membership status, one-off-lab purchase status, or subscription status from ULC/Kite?'),
  ('00000000-0000-4000-8000-000000000005', 'ulc-lifeforce', 'One-off labs and status', 'ULC', 'What should one-off labs users see if membership status is unavailable in V0?'),
  ('00000000-0000-4000-8000-000000000006', 'ulc-lifeforce', 'One-off labs and status', 'ULC', 'Do one-off labs users receive LifeScore, recommendations, or a clinician visit?'),
  ('00000000-0000-4000-8000-000000000007', 'ulc-lifeforce', 'Products, supplements, and services', 'ULC', 'Are supplements purchasable in-app, BOPUS, or in-center only at launch?'),
  ('00000000-0000-4000-8000-000000000008', 'ulc-lifeforce', 'Products, supplements, and services', 'ULC', 'Should supplement recommendations display as available at your local ULC until purchase support is confirmed?'),
  ('00000000-0000-4000-8000-000000000009', 'ulc-lifeforce', 'Products, supplements, and services', 'ULC', 'Which ULC services/modalities can be recommended and deep-linked from post-clinician recommendations?'),
  ('00000000-0000-4000-8000-000000000010', 'ulc-lifeforce', 'Blood draw and questionnaire data', 'ULC', 'What scheduled, processing, or completed blood draw status data can Lifeforce receive from ULC/Kite?'),
  ('00000000-0000-4000-8000-000000000011', 'ulc-lifeforce', 'Blood draw and questionnaire data', 'ULC', 'Can the embedded view receive blood draw date/time, or only a booked/scheduled status?'),
  ('00000000-0000-4000-8000-000000000012', 'ulc-lifeforce', 'Results, documents, and LifeScore', 'ULC', 'Should Documents and upload functionality be included in V0?'),
  ('00000000-0000-4000-8000-000000000013', 'ulc-lifeforce', 'Results, documents, and LifeScore', 'ULC', 'Should LifeScore have a dedicated detail page in V0, and what explanatory content should it include?'),
  ('00000000-0000-4000-8000-000000000014', 'ulc-lifeforce', 'Recommendations and care plan', 'ULC', 'Which prescription recommendation CTAs should be used: Subscribe, Add to Cart, Order, or View Details?'),
  ('00000000-0000-4000-8000-000000000015', 'ulc-lifeforce', 'Recommendations and care plan', 'ULC', 'Can recommended prescription shipments be batched, or should each product deep link independently?')
on conflict (id) do update set
  category = excluded.category,
  author = excluded.author,
  text = excluded.text,
  updated_at = now();
