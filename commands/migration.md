---
description: Create a Supabase migration file with correct timestamp, RLS, and seed update
argument-hint: [description]
allowed-tools: Read, Write, Edit, Bash(supabase:*), Bash(git:*)
disable-model-invocation: true
---

Create a Supabase migration for: $ARGUMENTS

## Steps

1. **Gather context** (if $ARGUMENTS is empty, ask):
   - Type of change: new table, new column, modify, drop
   - Table name(s) involved
   - Business constraints: uniqueness, nullable, foreign keys, indexes

2. **Generate the SQL**
   - File name: `supabase/migrations/YYYYMMDDHHMMSS_<short_description>.sql`
   - Use the exact current timestamp for the prefix
   - **Show the full SQL and wait for approval before writing the file**

   Template:
   ```sql
   -- Migration: <description>
   -- Ticket: <current branch ticket>

   -- Main change
   <CREATE TABLE / ALTER TABLE / ...>

   -- RLS (required on every new table)
   ALTER TABLE <table> ENABLE ROW LEVEL SECURITY;
   CREATE POLICY "<policy_name>" ON <table>
     FOR ALL USING (auth.uid() = user_id);

   -- Indexes (if relevant)
   CREATE INDEX ON <table>(<column>);
   ```

3. **Write the file** after approval

4. **Check seed.sql**
   - If a new table was created, propose realistic test data rows to add in `supabase/seed.sql`
   - Remind: without seed data, Supabase branch previews will be empty and untestable

5. **Commit**
   ```
   git add supabase/migrations/ supabase/seed.sql
   git commit -m "migration(<table>): <description> (<ticket>)"
   ```

## Rules

- RLS is **mandatory** on every new table — no exceptions
- One migration = one objective — never combine two schema changes in one file
- Never run `supabase db push` — migrations are applied automatically via PRs
- Never modify a migration that has already been merged to main
- The SQL file does nothing until it is inside an open PR
