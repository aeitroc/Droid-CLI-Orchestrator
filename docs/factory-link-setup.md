# Factory Link - Quick Project Setup Guide

## Overview

`factory-link` bootstraps a project with the latest Factory droid definitions, orchestrator configs, and shared documentation. It prepares the groundwork for manual coordination using the orchestrator methodology.

**What it does:**
- Copies `droids/` and `orchestrator/` into your project for local customization.
- Symlinks shared references like `AGENTS.md`, `DROID.md`, and `docs/` so you always inherit updates.
- Adds convenience symlinks for `bin/` (helper scripts) and keeps configuration files (`config.json`, `settings.json`) synchronized.

---

## Installation

`factory-link` is provided via an alias:

```bash
alias factory-link
```

If nothing prints, add the alias manually:

```bash
echo 'alias factory-link="/Users/besi/.factory/scripts/create-factory-symlinks.sh"' >> ~/.aliases
source ~/.aliases
```

---

## Running `factory-link`

From the root of the target project:

```bash
factory-link
```

The script performs the following:

| Component | Action |
| --- | --- |
| `droids/` | Copied so you can edit local droid definitions |
| `orchestrator/` | Copied (config + docs) |
| `docs/` | Symlinked to keep canonical documentation |
| `bin/` | Symlinked helper scripts (e.g., `verify-droids.sh`) |
| `config.json`, `settings.json`, `AGENTS.md`, `DROID.md` | Symlinked |
| `tasks/` | Created if missing |

Run `ls -al` to confirm symlinks vs. copies.

---

## Post-Setup Checklist

1. **Verify workspace contents**
   - Ensure `droids/` includes the orchestrator profile and supporting specialists.
   - Confirm `orchestrator/` contains configuration, task patterns, and documentation.

2. **Review configuration files**
   - Inspect `orchestrator/orchestrator-config.json` to understand governance parameters.
   - Study `orchestrator/task-patterns.json` for available execution templates.

3. **Prepare process notes**
   - Document how your team will apply the orchestrator phases manually inside Factory sessions.
   - Store reusable prompts, checklists, and acceptance criteria in the project’s `tasks/` or `docs/` folders.

---

## After Linking

- Coordinate work by following the phase guidance described in `docs/orchestrator-step-by-step-example.md`.
- Capture outputs in task-specific folders to maintain traceability.
- Update documentation whenever patterns or configs evolve.

---

## Updating Linked Projects

Re-run `factory-link` periodically to resync docs and configs. Local edits under `droids/` or `orchestrator/` remain intact because they were copied, not symlinked.

---

## Troubleshooting

| Issue | Fix |
| --- | --- |
| `alias: not found` | Re-source shell profile or add the alias manually |
| Missing directories | Inspect the script output and re-run `factory-link` |
| Configuration feels outdated | Pull the latest repository changes, then re-run `factory-link` |
| Need to unlink | Remove the created symlinks (e.g., `rm docs`) and rerun `factory-link` |

Once the project is linked, rely on the orchestrator documentation to manage multi-phase work manually.
