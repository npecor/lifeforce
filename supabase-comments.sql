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
