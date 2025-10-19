# Droid Factory CLI – Orchestrator Reference

Documentation and configuration for coordinating Factory droids through a **manual orchestration workflow**. This repository no longer ships automation scripts or wrapper commands; instead it provides the assets and guidance you need to drive the orchestrator yourself inside a Factory session.

---

## 📚 Key References

- `docs/QUICK-SETUP.md` – Checklist for confirming required orchestrator assets
- `docs/orchestrate-quickstart.md` – Manual step-by-step quick start
- `docs/orchestrator-step-by-step-example.md` – Example authentication engagement
- `docs/orchestrator-with-droid-exec.md` – Future automation blueprint (non-functional today)
- `orchestrator/orchestrator-config.json` – Governance and quality gate settings
- `orchestrator/task-patterns.json` – Predefined phase templates

---

## 🧭 What the Orchestrator Does (Manual Mode)

The orchestrator droid remains available and can still:
- Analyze complex requests and suggest execution strategies
- Recommend which specialists to involve (frontend, backend, QA, security, etc.)
- Reference shared context and quality expectations defined in `orchestrator/`

What **you** must do manually:
1. Start a Factory session and invoke `@orchestrator` with your task.
2. When prompted, provide project paths, stack details, or constraints.
3. Based on the orchestrator’s plan, call each specialist droid (`@backend-architect`, `@frontend-developer`, etc.) yourself.
4. Capture outputs, decisions, and artifacts in your task folder (`tasks/<domain>/<date>/<slug>/`).
5. Apply the quality gates documented in `orchestrator/automated-quality-gates.md` before closing the task.

No background automation runs—every phase is initiated and tracked by you.

---

## ✅ Getting Ready

1. **Verify assets** (see `docs/QUICK-SETUP.md`): confirm `droids/orchestrator.md`, `orchestrator/orchestrator-config.json`, and `orchestrator/task-patterns.json` exist.
2. **Review the documentation** under `orchestrator/` to understand context management, conflict resolution, and performance metrics.
3. **Set up task folders** following the conventions in `AGENTS.md` to store research, plans, and outcomes.

Optional: create personal aliases or helper scripts outside this repo if you want shortcuts, but keep them separate to avoid confusion.

---

## 🔄 Manual Workflow Outline

1. **Research & Planning**
   - Record notes in `tasks/.../research.md`.
   - Map the request to a pattern in `task-patterns.json`.
2. **Execution**
   - Invoke recommended droids one phase at a time.
   - Update shared context as described in `orchestrator/context-manager.md`.
3. **Quality Gates**
   - Run through security, testing, and performance checks defined in the config docs.
4. **Synthesis**
   - Summarize outcomes, metrics, and follow-up work in the task folder.

This mirrors the former automated flow but relies on human coordination.

---

## 📁 Directory Overview

```
~/.factory/
├── README.md                        # This reference
├── AGENTS.md / DROID.md             # Coding rules and agent conventions
├── droids/                          # All droid definitions (including orchestrator.md)
├── orchestrator/                    # Config + documentation for orchestration methodology
├── docs/                            # High-level guides referenced above
├── bin/                             # Utility scripts (verify/fix droids)
├── scripts/                         # Symlink helper (create-factory-symlinks.sh)
├── tasks/                           # Research/planning/verification artifacts per task
└── …                                # Supporting config/history files
```

Note: `scripts/` no longer contains orchestration entrypoints; only maintenance helpers remain.

---

## 🚧 Roadmap for Future Automation

If you plan to restore automated orchestration:
- Implement a CLI entrypoint mirroring the architecture in `docs/orchestrator-with-droid-exec.md`.
- Add regression tests that validate sequential, parallel, and hybrid plans using the existing JSON configs.
- Update this README and accompanying docs once automation is available again.

Until then, treat this repository as the **source of truth for manual orchestration best practices**.
