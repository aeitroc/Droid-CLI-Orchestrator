# Factory Link - Quick Project Setup Guide

## Overview

`factory-link` is a command-line utility that sets up essential Factory droid system files in your current directory. This tool streamlines project setup by giving instant access to all droids, scripts, and configuration files.

**Hybrid Approach:**
- **Copies** `droids/` and `orchestrator/` directories - giving your project standalone, customizable versions
- **Creates symlinks** for `AGENTS.md` and `scripts/` - keeping them in sync with the central system

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

1. **Check** if all source files and directories exist
2. **Remove** any existing files/directories with conflicting names
3. **Create symbolic links** for:
   - `AGENTS.md` → Coding guidelines and AI agent rules
   - `scripts/` → Automation scripts including orchestrate.sh
4. **Copy directories** for:
   - `droids/` → All 44 specialized droid definitions (43+ files)
   - `orchestrator/` → Orchestrator system configuration (15+ files)
5. **Verify** each operation was successful
6. **Report** a summary with file counts

---

## Example Output

```bash
$ cd ~/Code/my-new-project
$ factory-link

🚀 Setting up Factory system in: /Users/besi/Code/my-new-project
================================================
📋 Checking source files for symlinks...
✅ Found: /Users/besi/.codex/AGENTS.md
✅ Found: /Users/besi/.factory/scripts

📋 Checking source directories for copying...
✅ Found: /Users/besi/.factory/droids
✅ Found: /Users/besi/.factory/orchestrator

🔗 Creating symlinks...
🔗 Linking: AGENTS.md -> /Users/besi/.codex/AGENTS.md
✅ Created symlink: AGENTS.md
🔗 Linking: scripts -> /Users/besi/.factory/scripts
✅ Created symlink: scripts

📦 Copying directories...
📦 Copying: droids
✅ Copied: droids (43 files)
📦 Copying: orchestrator
✅ Copied: orchestrator (15 files)

🎉 Setup complete!
📁 Created 2 symlinks and copied 2 directories in /Users/besi/Code/my-new-project

📋 Summary:

Symlinks created:
   🔗 AGENTS.md -> /Users/besi/.codex/AGENTS.md
   🔗 scripts -> /Users/besi/.factory/scripts

Directories copied:
   📦 droids/ (43 files)
   📦 orchestrator/ (15 files)
```

---

## Why This Hybrid Approach?

### Copies vs Symlinks

**Why copy droids/ and orchestrator/?**
- **Independence**: Your project has its own copy that won't be affected by changes in the central system
- **Customization**: You can modify droids for project-specific needs without affecting other projects
- **Safety**: No risk of circular dependencies or broken symlinks
- **Performance**: Direct file access without symlink resolution overhead

**Why symlink AGENTS.md and scripts/?**
- **Central Updates**: Coding guidelines and scripts stay in sync across all projects
- **Maintenance**: One central location to update rules and automation scripts
- **Consistency**: All projects use the same latest versions
- **Storage**: Saves disk space by not duplicating large files

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

## What Gets Set Up?

### AGENTS.md (Symlinked)
- **Source**: `/Users/besi/.codex/AGENTS.md`
- **Type**: Symlink
- **Purpose**: Contains coding guidelines, rules, and AI agent behavior
- **Use**: Referenced by AI assistants for consistent code generation
- **Note**: Always in sync with central system for consistency

### scripts/ (Symlinked)
- **Source**: `/Users/besi/.factory/scripts`
- **Type**: Symlink
- **Purpose**: Automation scripts and utilities
- **Use**: Command-line tools for common operations
- **Contents**:
  - `orchestrate.sh` - Main orchestrator script
  - `create-factory-symlinks.sh` - This factory-link script
- **Note**: Always in sync with central system for latest updates

### droids/ (Copied)
- **Source**: `/Users/besi/.factory/droids`
- **Type**: Copy (43 files)
- **Purpose**: Directory containing 44 specialized droid definitions
- **Use**: Used by Factory CLI to execute specialized tasks
- **Contents**:
  - Frontend droids (React, Next.js, Mobile)
  - Backend droids (TypeScript, Architecture, APIs)
  - DevOps droids (Docker, Cloud, CI/CD)
  - Security droids (Auditor, Penetration Tester)
  - And 36 more...
- **Note**: Independent copy allows project-specific customization

### orchestrator/ (Copied)
- **Source**: `/Users/besi/.factory/orchestrator`
- **Type**: Copy (15 files)
- **Purpose**: Orchestrator system configuration and task patterns
- **Use**: Powers the intelligent multi-droid coordination
- **Contents**:
  - Task patterns (task-patterns.json)
  - Orchestrator configuration
  - Context management
  - Performance analytics
  - Plugin architecture
- **Note**: Independent copy allows project-specific configuration

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
