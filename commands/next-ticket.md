---
description: Close the current ticket, clean up the branch, and surface the next priority
allowed-tools: Bash(git:*), Bash(supabase:*), mcp__linear-server__*, mcp__github__*
disable-model-invocation: true
---

Close the current ticket and prepare for the next one.

## Steps

1. **Detect the current ticket**
   - `git branch --show-current` → extract the ticket ID from the branch name
   - Example: `feat/KOS-42-bookings` → `KOS-42`

2. **Verify the PR is merged**
   - Check on GitHub that the PR for this branch is in a merged state
   - If not merged yet: stop and warn — do not mark Done prematurely

3. **Mark Done in Linear**
   - Set the ticket to **Done**

4. **Regenerate TypeScript types if the PR contained a migration**
   - `supabase gen types typescript --local > src/types/supabase.ts`
   - `git commit -m "chore(types): regenerate supabase types after <ticket>"`

5. **Clean up the branch**
   ```bash
   git checkout main
   git pull origin main
   git branch -d <current-branch>
   git remote prune origin
   ```

6. **Surface the next tickets**
   - Fetch all Linear tickets assigned to the current user with status **Todo**
   - Sort by priority: Urgent → High → Medium → Low
   - Display the top 3 with: ID, title, priority, estimate
   - Ask which one to start

## Rules

- Never delete the branch before the PR is confirmed merged
- Always commit updated TypeScript types before switching branches
- If `git branch -d` fails (unmerged warning), investigate before forcing deletion
