# Factory Link - Quick Project Setup Guide

## Overview

`factory-link` is a command-line utility that creates symbolic links to all essential Factory droid system files in your current directory. This tool streamlines project setup by giving instant access to all droids, scripts, and configuration files.

## Installation

The `factory-link` command is already installed and available as an alias in your shell.

### Verify Installation

```bash
# Check if the alias exists
alias factory-link

# Should output:
# alias factory-link='/Users/besi/.factory/scripts/create-factory-symlinks.sh'
```

### Manual Installation (if needed)

If the alias is not available, add it manually:

```bash
# Add to ~/.aliases or ~/.zshrc
echo 'alias factory-link="/Users/besi/.factory/scripts/create-factory-symlinks.sh"' >> ~/.aliases

# Reload your shell configuration
source ~/.aliases
# OR
source ~/.zshrc
```

---

## Usage

### Basic Usage

Navigate to any directory and run:

```bash
cd /path/to/your/project
factory-link
```

### What Happens?

The script will:

1. **Check** if all source files exist
2. **Remove** any existing files/symlinks with conflicting names
3. **Create** symbolic links to:
   - `AGENTS.md` → Coding guidelines and AI agent rules
   - `droids/` → All 44 specialized droid definitions
   - `orchestrator/` → Orchestrator system configuration
   - `scripts/` → Automation scripts including orchestrate.sh

4. **Verify** each symlink was created successfully
5. **Report** a summary of created links

---

## Example Output

```bash
$ cd ~/Code/my-new-project
$ factory-link

🔗 Creating symlinks in: /Users/besi/Code/my-new-project
==================================
📋 Checking source files...
✅ Found: /Users/besi/.codex/AGENTS.md
✅ Found: /Users/besi/.factory/droids
✅ Found: /Users/besi/.factory/orchestrator
✅ Found: /Users/besi/.factory/scripts

🔗 Creating symlinks...
🔗 Linking: AGENTS.md -> /Users/besi/.codex/AGENTS.md
✅ Created: AGENTS.md
🔗 Linking: droids -> /Users/besi/.factory/droids
✅ Created: droids
🔗 Linking: orchestrator -> /Users/besi/.factory/orchestrator
✅ Created: orchestrator
🔗 Linking: scripts -> /Users/besi/.factory/scripts
✅ Created: scripts

🎉 Symlink creation complete!
📁 Created 4 symlinks in /Users/besi/Code/my-new-project

📋 Created symlinks:
   AGENTS.md -> /Users/besi/.codex/AGENTS.md
   droids -> /Users/besi/.factory/droids
   orchestrator -> /Users/besi/.factory/orchestrator
   scripts -> /Users/besi/.factory/scripts
```

---

## Use Cases

### 1. New Project Initialization

When starting a new project, run `factory-link` to immediately have access to all Factory tools:

```bash
mkdir my-new-app
cd my-new-app
factory-link

# Now you can use droids and orchestrator
./scripts/orchestrate.sh "Initialize project structure" medium
```

### 2. Team Collaboration

Share the same droid configurations across multiple projects:

```bash
# Project A
cd ~/projects/frontend-app
factory-link

# Project B
cd ~/projects/backend-api
factory-link

# Both now have access to the same droids!
```

### 3. Development Workflow

Keep all your active projects in sync with the latest droid updates:

```bash
# Update happens in ~/.factory/droids
# All projects with symlinks automatically get the updates!

cd ~/project-1
factory-link  # Links to ~/.factory/droids

cd ~/project-2
factory-link  # Links to same ~/.factory/droids

# Any change to droids propagates to both projects
```

### 4. Quick Access to Tools

Have the orchestrator and all scripts available directly:

```bash
cd ~/some-project
factory-link

# Now accessible:
./scripts/orchestrate.sh "Add feature"
./scripts/create-factory-symlinks.sh
```

---

## What Gets Linked?

### AGENTS.md
- **Source**: `/Users/besi/.codex/AGENTS.md`
- **Purpose**: Contains coding guidelines, rules, and AI agent behavior
- **Use**: Referenced by AI assistants for consistent code generation

### droids/
- **Source**: `/Users/besi/.factory/droids`
- **Purpose**: Directory containing 44 specialized droid definitions
- **Use**: Used by Factory CLI to execute specialized tasks
- **Contents**:
  - Frontend droids (React, Next.js, Mobile)
  - Backend droids (TypeScript, Architecture, APIs)
  - DevOps droids (Docker, Cloud, CI/CD)
  - Security droids (Auditor, Penetration Tester)
  - And 36 more...

### orchestrator/
- **Source**: `/Users/besi/.factory/orchestrator`
- **Purpose**: Orchestrator system configuration and task patterns
- **Use**: Powers the intelligent multi-droid coordination
- **Contents**:
  - Task patterns (task-patterns.json)
  - Orchestrator configuration
  - Context management
  - Performance analytics
  - Plugin architecture

### scripts/
- **Source**: `/Users/besi/.factory/scripts`
- **Purpose**: Automation scripts and utilities
- **Use**: Command-line tools for common operations
- **Contents**:
  - `orchestrate.sh` - Main orchestrator script
  - `create-factory-symlinks.sh` - This factory-link script

---

## Features

### ✅ Safe Operations

- **Existence Check**: Verifies source files exist before creating links
- **Conflict Resolution**: Removes existing files/symlinks with same name
- **Non-destructive**: Safely handles existing content

### ✅ Smart Behavior

- **Selective Linking**: Only creates links for files that exist
- **Error Handling**: Continues if some sources are missing
- **Verification**: Confirms each link was created successfully

### ✅ Clear Feedback

- **Progress Indicators**: Shows what's happening at each step
- **Status Emojis**: Visual feedback for quick scanning
- **Summary Report**: Lists all created symlinks at the end

### ✅ Idempotent

Running `factory-link` multiple times is safe:
- Removes old symlinks
- Creates fresh links
- Always results in the same final state

---

## Troubleshooting

### Issue: "Command not found: factory-link"

**Solution**: The alias isn't loaded in your shell.

```bash
# Reload your aliases
source ~/.aliases

# Or add to your shell rc file
echo 'alias factory-link="/Users/besi/.factory/scripts/create-factory-symlinks.sh"' >> ~/.zshrc
source ~/.zshrc
```

### Issue: "Permission denied"

**Solution**: Make sure the script is executable.

```bash
chmod +x /Users/besi/.factory/scripts/create-factory-symlinks.sh
```

### Issue: "Missing source file"

**Solution**: The Factory system might not be fully installed.

```bash
# Verify Factory installation
ls -la /Users/besi/.factory/

# Check for required directories
ls /Users/besi/.factory/droids
ls /Users/besi/.factory/scripts
ls /Users/besi/.factory/orchestrator
ls /Users/besi/.codex/AGENTS.md
```

### Issue: Symlinks point to wrong location

**Solution**: Run factory-link again to recreate the links.

```bash
cd /your/project
factory-link
```

The script will remove old symlinks and create new ones.

---

## Advanced Usage

### Running Directly (Without Alias)

```bash
/Users/besi/.factory/scripts/create-factory-symlinks.sh
```

### Using in Scripts

```bash
#!/bin/bash
# Setup script for new projects

PROJECT_DIR="/path/to/new/project"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Initialize git
git init

# Create Factory symlinks
/Users/besi/.factory/scripts/create-factory-symlinks.sh

# Now use orchestrator
./scripts/orchestrate.sh "Initialize project" medium
```

### Batch Setup for Multiple Projects

```bash
#!/bin/bash
# Setup Factory links for all projects

PROJECTS=(
  "/Users/besi/Code/project-a"
  "/Users/besi/Code/project-b"
  "/Users/besi/Code/project-c"
)

for project in "${PROJECTS[@]}"; do
  echo "Setting up $project..."
  cd "$project"
  factory-link
done

echo "✅ All projects configured!"
```

---

## Integration with CI/CD

### GitHub Actions

```yaml
name: Setup Factory
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Factory System
        run: |
          # Install Factory CLI
          curl -fsSL https://app.factory.ai/cli | sh
          
          # Create symlinks
          factory-link
          
      - name: Run Orchestrator
        env:
          FACTORY_API_KEY: ${{ secrets.FACTORY_API_KEY }}
        run: |
          ./scripts/orchestrate.sh "Run tests" medium
```

### Local Development

Add to your project's setup script:

```bash
# setup.sh
#!/bin/bash

echo "🚀 Setting up project..."

# Install dependencies
npm install

# Setup Factory tools
factory-link

echo "✅ Setup complete!"
```

---

## Best Practices

### 1. Run After Cloning Projects

```bash
git clone https://github.com/user/repo.git
cd repo
factory-link
npm install
```

### 2. Add to .gitignore

The symlinks should not be committed to git:

```gitignore
# .gitignore
AGENTS.md
droids/
orchestrator/
scripts/
```

### 3. Document in Project README

```markdown
## Setup

1. Clone the repository
2. Run `factory-link` to set up AI tools
3. Run `npm install` to install dependencies
```

### 4. Use in Onboarding

Include in your team's onboarding docs:

> **Setting Up AI Tools**
> 
> Our projects use the Factory droid system. To set it up:
> ```bash
> factory-link
> ```
> 
> This gives you access to 44 specialized AI droids and the orchestrator.

---

## Related Commands

### Orchestrator
```bash
./scripts/orchestrate.sh "task description" [autonomy]
```

### List Droids
```bash
factory
# Interactive droid selector
```

### Verify System
```bash
/Users/besi/.factory/bin/verify-droids.sh
```

---

## More Information

- **Main README**: `/Users/besi/.factory/README.md`
- **Orchestrator Guide**: `/Users/besi/.factory/docs/orchestrate-quickstart.md`
- **Droid Documentation**: `/Users/besi/.factory/docs/orchestrator-capabilities.md`
- **Factory Docs**: https://docs.factory.ai/

---

**Version**: 1.0  
**Last Updated**: October 17, 2024  
**Script Location**: `/Users/besi/.factory/scripts/create-factory-symlinks.sh`
