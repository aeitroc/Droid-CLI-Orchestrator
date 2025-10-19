# Quick Setup - Orchestrator Assets

The orchestrator currently operates as a documented coordination pattern. Follow these checks to ensure your workspace contains the required references before using it manually within Factory sessions.

---

## 1. Confirm Key Files Exist

- `droids/orchestrator.md`
- `orchestrator/orchestrator-config.json`
- `orchestrator/task-patterns.json`
- `orchestrator/context-manager.md`

If any are missing, synchronize from the source repository before continuing.

---

## 2. Review Configuration

1. Open `orchestrator/orchestrator-config.json` and verify values such as `max_concurrent_phases`, `quality_gates`, and `notifications` align with your process expectations.
2. Inspect `orchestrator/task-patterns.json` to understand predefined phase templates.
3. Read `orchestrator/automated-quality-gates.md` and related docs to see how governance is intended to work.

---

## 3. Prepare Manual Workflow Notes

Because no automated shell wrapper or CLI shortcut is provided, outline how you will:
- Capture requests for each phase.
- Delegate to individual droids within Factory’s interactive session.
- Record outputs, approvals, and follow-up tasks.

Document these steps in your project README or runbook so the team executes orchestration consistently.

---

## 4. Optional Helpers

- Create personal aliases or scripts if you want to streamline manual steps, but keep them outside this repository to avoid confusion.
- Store reusable prompts or task outlines in `tasks/` for future invocations.

These preparations set expectations without relying on previously documented automation.
