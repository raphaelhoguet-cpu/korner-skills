---
description: Start a Linear ticket — creates Git branch and sets status to In Progress
argument-hint: <ticket-id>
allowed-tools: Bash(git:*), mcp__linear-server__*, mcp__github__*
disable-model-invocation: true
---

Fetch the Linear ticket $ARGUMENTS and start working on it.

## Steps

1. **Fetch the ticket from Linear**
   - Get title, description, acceptance criteria, labels, and estimate
   - Summarize the ticket in 3 bullet points
   - Identify whether a Supabase migration will likely be needed (yes/no + reason)

2. **Update Linear status**
   - Set ticket $ARGUMENTS to **In Progress**
   - Remove label `ready-for-claude` if present

3. **Prepare the Git branch**
   - `git checkout main && git pull origin main`
   - Generate branch name from ticket title:
     - Bug → `fix/$ARGUMENTS-short-name`
     - Feature → `feat/$ARGUMENTS-short-name`
     - Chore/refactor → `chore/$ARGUMENTS-short-name`
   - `git checkout -b <branch-name>`

4. **Show a summary**
   - Ticket: ID + title
   - Branch name created
   - Migration likely needed: yes/no + reason
   - Recommended next step

## Rules

- Always branch from main — never from another non-merged branch
- Never touch the Supabase dashboard at this stage — all DB work is done locally via `supabase start`
- For complex tickets (estimate > 30 min), propose a plan and wait for explicit approval before writing code
