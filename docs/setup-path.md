# Environment Notes for the Orchestrator

The orchestrator documentation no longer prescribes a dedicated command-line entrypoint. As a result, no additional PATH configuration is required beyond your normal Factory CLI setup.

---

## Recommended Preparation

1. Ensure your shell already exposes Factory utilities (for example, `factory` or `droid`) if you plan to operate interactively.
2. Keep manual reference material—such as orchestration checklists or prompt snippets—in your preferred location (project README, docs directory, or personal notes).
3. Review the documentation under `orchestrator/` to understand coordination phases, quality gates, and context sharing expectations.

---

## Cleaning Up Legacy Aliases

If you previously added aliases for removed orchestration scripts, delete them from your shell profile to avoid confusion.

```bash
# Example cleanup commands
sed -i '' '/orchestrator/d' ~/.zshrc
sed -i '' '/orchestration/d' ~/.zshrc
```

Restart your shell after editing.

---

## Next Steps

Use the documentation to guide how you interact with droids manually. Capture outcomes in project-specific notes or task folders for traceability.
