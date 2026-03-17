# korner-skills

Claude Code plugin for the Korner development workflow.

## Commands

| Command | Description |
|---------|-------------|
| `/start-issue <ticket-id>` | Start a Linear ticket — creates Git branch, sets status to In Progress |
| `/migration [description]` | Create a Supabase migration with correct timestamp, RLS, and seed update |
| `/ship-issue <ticket-id>` | Run tests, rebase, open PR, set Linear to In Review |
| `/next-ticket` | Close current ticket, clean up branch, surface next priority |

## Install

```bash
claude plugin install korner-skills@raphaelhoguet-cpu/korner-skills
```

## Uninstall

```bash
claude plugin uninstall korner-skills@raphaelhoguet-cpu/korner-skills
```

## Update

```bash
claude plugin update korner-skills@raphaelhoguet-cpu/korner-skills
```
