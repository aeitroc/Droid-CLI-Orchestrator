# Orchestrator Quick Start (Manual Mode)

The orchestrator currently serves as a coordination framework. Use this guide to prepare for manual execution inside Factory sessions.

---

## 1. Understand the Building Blocks

- **Droid Directory** – Review available specialists in `droids/`.
- **Configuration** – Inspect `orchestrator/orchestrator-config.json` for timeout, retry, and quality gate policies.
- **Patterns** – Study `orchestrator/task-patterns.json` to understand predefined phase structures.
- **Documentation** – Read the markdown files under `orchestrator/` describing context management, conflict handling, and analytics.

---

## 2. Capture an Orchestration Request

Create a new task folder under `tasks/<domain>/<date>/<slug>/` and record:
- User request or problem statement.
- Known constraints or dependencies.
- Initial risk assessment.

---

## 3. Draft the Plan

- Map the request to a pattern (sequential, parallel, hybrid).
- List required droids per phase and the outputs you expect from each.
- Record acceptance criteria and quality gates to enforce.

---

## 4. Execute Phases Manually

Within your Factory session:
1. Provide the relevant context to the specialist droid.
2. Capture outputs in the task folder (notes, code diffs, review summaries).
3. Update the shared context after each phase so downstream contributors understand prior decisions.

---

## 5. Close Out the Task

- Run through the quality checklist in `orchestrator/automated-quality-gates.md`.
- Log outstanding risks or follow-up items.
- Summarize the orchestration in a final report stored alongside task artifacts.

---

## 6. Continuous Improvement

Document lessons learned and adjust patterns or configs to reflect new best practices. Re-run these steps for future tasks to maintain consistency.
