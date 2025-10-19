# Orchestrator - Step-by-Step Example

This walkthrough illustrates how to coordinate a medium-complexity feature using the orchestrator methodology. It focuses on decision points and artifacts rather than executable commands.

---

## Scenario

Build a complete user authentication system covering login, registration, and password reset while enforcing security best practices.

---

## Phase Outline

1. **Task Analysis & Planning**
   - Capture requirements, constraints, and success criteria.
   - Select the matching pattern from `task-patterns.json` (hybrid strategy).
   - Document assumptions and clarifying questions.

2. **Architecture Design**
   - Produce API contracts, data models, and system diagrams.
   - Record deliverables in the task folder (`tasks/backend/...`).

3. **Security Review**
   - Evaluate planned flows against OWASP guidance.
   - Note mandatory controls (rate limiting, MFA hooks, password policies).

4. **Parallel Implementation**
   - Backend specialists implement services, database migrations, and session/token logic.
   - Frontend specialists build UI forms, validation handling, and error messaging.
   - Maintain a shared context document to track progress and blockers.

5. **Testing & Review**
   - Quality engineers create integration and regression tests.
   - Reviewers assess code quality, adherence to guidelines, and ready-for-production status.

6. **Synthesis**
   - Compile a final report summarizing outcomes, risks, metrics, and follow-up work.
   - Archive outputs in project documentation for future reference.

---

## Artifacts to Produce

- Architecture specification (diagrams, data contracts).
- Security checklist with resolved/unresolved risks.
- Implementation notes per domain (backend, frontend, infrastructure).
- Test results and coverage summary.
- Final orchestrator report consolidating all findings.

---

## Execution Tips

- Use the `tasks/` workspace to log context per phase; follow the naming convention described in `AGENTS.md`.
- Leverage `orchestrator/context-manager.md` as the template for recording shared knowledge.
- Apply the quality gate criteria in `automated-quality-gates.md` before closing each phase.

This example demonstrates the human-driven process until automation tooling is available.
