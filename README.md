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

## Update

Après un merge sur main, chaque membre met à jour avec :

```bash
claude plugin update korner-skills@raphaelhoguet-cpu/korner-skills
```

## Modifier les skills

1. Créer une branche depuis `main`
2. Éditer les fichiers dans `commands/`
3. Ouvrir une PR sur GitHub
4. Review + merge par un membre de l'équipe
5. Chaque utilisateur fait un `claude plugin update` pour récupérer les changements

## Uninstall

```bash
claude plugin uninstall korner-skills@raphaelhoguet-cpu/korner-skills
```
