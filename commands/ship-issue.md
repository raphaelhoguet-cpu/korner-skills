---
description: Ship a ticket — runs tests, rebases, opens PR, sets Linear to In Review
argument-hint: <ticket-id>
allowed-tools: Bash(git:*), Bash(pnpm:*), Bash(supabase:*), mcp__linear-server__*, mcp__github__*
disable-model-invocation: true
---

Ship ticket $ARGUMENTS: run checks, open a PR, and update Linear.

## Steps

1. **Quality checks** — stop and fix before continuing if any fail
   - `pnpm lint`
   - `pnpm test`
   - `pnpm build`
   - If types are missing after a migration: `supabase gen types typescript --local > src/types/supabase.ts`

2. **Self-review**
   - Analyze the full diff against the acceptance criteria of $ARGUMENTS
   - Flag any gaps: missing tests, missing RLS, unhandled edge cases, missing docs
   - Show a confidence score out of 10 with specific concerns

3. **Rebase onto main**
   - `git fetch origin && git rebase origin/main`
   - On conflict: resolve carefully — for SQL migration conflicts, rename the timestamp rather than merging SQL content

4. **Open the PR on GitHub**

   Title: `<type>(<scope>): <description> ($ARGUMENTS)`

   Body:
   ```
   ## Context
   <1–2 sentences from the ticket>

   ## Changes
   - <list of modified files / features>

   ## Supabase migrations
   - <list migration files, or "None">

   ## How to test
   1. <step-by-step>

   ## Ticket
   Linear: $ARGUMENTS
   ```

5. **Update Linear**
   - Set $ARGUMENTS to **In Review**
   - Post the GitHub PR link as a comment on the ticket

## What Supabase does automatically after the PR is opened

Supabase detects the new PR via GitHub integration and:
- Clones the main branch database
- Applies `seed.sql` (test data)
- Applies all new migrations from this branch
- Generates a unique preview URL + dedicated API keys
- Posts the preview URL as a comment on the PR

## Rules

- Never merge the PR yourself — a human reviewer always approves and merges
- If tests fail after 3 fix attempts, stop and explain the blocker clearly
