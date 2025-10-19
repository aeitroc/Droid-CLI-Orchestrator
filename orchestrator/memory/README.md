# Orchestrator Memory System

This directory contains the orchestrator's learning memory files. These files persist across projects and help the orchestrator improve over time by learning from past successes and failures.

## Memory Files

### 1. success_patterns.json
Contains proven patterns that have worked well in past projects.

**Structure:**
- `patterns[]`: Array of successful patterns
  - `id`: Unique identifier
  - `name`: Pattern name
  - `category`: frontend, backend, fullstack, cli, etc.
  - `description`: What this pattern does
  - `success_rate`: 0.0 to 1.0
  - `key_elements`: Array of important elements
  - `common_tools`: Tools commonly used
  - `file_structure`: Recommended file organization

**Usage:**
- Read BEFORE starting new projects
- Apply relevant patterns during planning
- Update with new successful patterns after project completion

### 2. failure_patterns.json
Documents anti-patterns and common mistakes to avoid.

**Structure:**
- `patterns[]`: Array of failure patterns
  - `id`: Unique identifier
  - `name`: Anti-pattern name
  - `category`: Domain category
  - `description`: What this anti-pattern is
  - `failure_rate`: 0.0 to 1.0
  - `common_issues`: Problems caused
  - `warning_signs`: What to watch for
  - `solutions`: How to fix/avoid

**Usage:**
- Check during planning phase
- Monitor for warning signs during execution
- Add new anti-patterns discovered

### 3. project_templates.json
Pre-configured starter templates for common project types.

**Structure:**
- `templates[]`: Array of project templates
  - `id`: Unique identifier
  - `name`: Template name
  - `category`: Project type
  - `tech_stack`: Technologies used
  - `file_structure`: Directory organization
  - `initial_commands`: Setup commands
  - `success_rate`: Historical success rate
  - `complexity`: low, medium, high
  - `estimated_setup_time`: Time estimate

**Usage:**
- Find suitable templates for new projects
- Bootstrap projects quickly
- Update with new templates that emerge

### 4. learning_metrics.json
Tracks performance metrics and insights across projects.

**Structure:**
- `global_metrics`: Overall statistics
  - `total_projects`, `successful_projects`, `failed_projects`
  - `success_rate`, `average_project_duration`
  - `most_used_patterns`, `most_common_technologies`
- `technology_metrics`: Success rates per technology
- `pattern_effectiveness`: Which patterns work best
- `project_insights`: Best practices and recommendations
- `learning_trends`: Emerging and declining technologies

**Usage:**
- Review before starting new projects
- Track technology trends
- Update after each project completion
- Identify areas for improvement

## Workflow Integration

### At Project Start
1. Read `success_patterns.json` for relevant patterns
2. Read `failure_patterns.json` for risks to avoid
3. Read `project_templates.json` for suitable templates
4. Read `learning_metrics.json` for current trends
5. Apply learned patterns to project planning

### During Execution
1. Monitor for failure pattern warning signs
2. Apply best practices from success patterns
3. Track which patterns are being used
4. Note new patterns or issues discovered

### After Project Completion
1. Update `success_patterns.json` with new patterns
2. Add new anti-patterns to `failure_patterns.json`
3. Update `project_templates.json` if applicable
4. Update `learning_metrics.json` with outcomes
5. Document lessons learned

## File Paths

These files are stored in `~/.factory/orchestrator/memory/` and persist across all projects:

```
/Users/besi/.factory/orchestrator/memory/
├── success_patterns.json       # Proven successful patterns
├── failure_patterns.json       # Anti-patterns to avoid
├── project_templates.json      # Starter templates
├── learning_metrics.json       # Performance metrics
└── README.md                   # This file
```

## Best Practices

1. **Always read memory files before planning** - Don't repeat past mistakes
2. **Update memory files after major milestones** - Keep learning current
3. **Be specific in pattern documentation** - Include concrete examples
4. **Track success rates accurately** - Use data to make decisions
5. **Review and prune periodically** - Remove outdated patterns
6. **Share insights across projects** - Memory is global, not project-specific

## Example Usage

### Starting a New React Project

```javascript
// 1. Read success_patterns.json
const patterns = readSuccessPatterns();
const reactPattern = patterns.find(p => p.id === 'react-component-pattern');
// Success rate: 0.95, use this pattern!

// 2. Read failure_patterns.json
const antiPatterns = readFailurePatterns();
const monolithicPattern = antiPatterns.find(p => p.id === 'monolithic-component-pattern');
// Watch for: components > 500 lines, multiple responsibilities

// 3. Read project_templates.json
const templates = readProjectTemplates();
const reactTemplate = templates.find(t => t.id === 'react-typescript-starter');
// Use recommended tech stack and file structure

// 4. Apply learnings to plan
plan = {
  pattern: reactPattern,
  avoid: monolithicPattern.warning_signs,
  template: reactTemplate,
  tech_stack: reactTemplate.tech_stack
};
```

## Maintenance

### Adding New Patterns
When you discover a new successful pattern:
1. Document it thoroughly with examples
2. Add to `success_patterns.json` with initial success_rate of 0.5
3. Update success_rate as you use it more
4. Include concrete file structures and tools

### Retiring Old Patterns
When a pattern becomes obsolete:
1. Move to an `archived_patterns.json` file (if needed)
2. Update `learning_metrics.json` to note decline
3. Document why it was retired
4. Suggest modern alternatives

### Performance Review
Periodically (monthly or quarterly):
1. Review all patterns for accuracy
2. Update success/failure rates based on data
3. Identify emerging trends
4. Prune outdated information
5. Generate insights report

## Version History

- **v1.0.0** (2025-06-18): Initial memory system implementation
  - Created base templates for all memory files
  - Established workflow integration
  - Documented usage patterns

---

**Note**: This is a living system that should evolve with each project. The more you use it, the smarter the orchestrator becomes!
