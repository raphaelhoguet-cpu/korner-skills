# korner-skills

Custom Claude Code commands for the Korner development workflow.

## Commands

| Command | Description |
|---------|-------------|
| `/start-issue <ticket-id>` | Start a Linear ticket — creates Git branch, sets status to In Progress |
| `/migration [description]` | Create a Supabase migration with correct timestamp, RLS, and seed update |
| `/ship-issue <ticket-id>` | Run tests, rebase, open PR, set Linear to In Review |
| `/next-ticket` | Close current ticket, clean up branch, surface next priority |

## Install

```bash
git clone git@github.com:raphaelhoguet-cpu/korner-skills.git
cd korner-skills
./install.sh
```

This symlinks the commands into `~/.claude/commands/` so they're available globally in Claude Code.

## Uninstall

```bash
./uninstall.sh
```

## Update

```bash
git pull
```

Since commands are symlinked, pulling the latest automatically updates them.
