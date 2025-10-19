# Droid Factory CLI – Intelligent Orchestration System

Complete orchestration system with intelligent planning, adaptive execution, and AI-powered specialist coordination. Features smart project analysis, learning capabilities, and proactive problem solving for complex multi-domain projects.

**Factory AI coding agents** are intelligent AI assistants that work directly in your projects via the `droid` command.

---

## 🎯 Quick Start

### 1. Setup Your Project

```bash
# Navigate to your project directory
cd /path/to/your/project

# Copy Factory assets to your project
cp -r ~/.factory/droids ./droids
cp -r ~/.factory/orchestrator ./orchestrator
mkdir -p tasks/{backend,frontend,general}

# Start Factory with the intelligent orchestrator
factory
```

### 2. Use the Smart Orchestrator

```bash
# Use the orchestrator directly within Factory
@orchestrator "Build your project description here"

# Or use manual orchestration
mkdir -p tasks/frontend/$(date +%d-%m-%YYYY)/my-project
touch tasks/frontend/$(date +%d-%m-%YYYY)/my-project/{research.md,plan.md,files-edited.md,verification.md
```

The orchestrator will:
- **Auto-detect** your tech stack and project structure
- **Intelligently plan** the execution strategy
- **Select** the best specialist droids for each task
- **Coordinate** parallel execution with Factory
- **Learn** from the project and improve future performance

---

## 🚀 Smart Orchestrator Features

### **Intelligent Project Analysis**
- Auto-detects project type (React, Next.js, Python, Django, etc.)
- Scans for tech stack patterns and dependencies
- Assesses complexity and risk factors automatically
- Predicts potential issues before they occur

### **Smart Droid Selection**
- Ranks specialists based on expertise and success history
- Adapts selection based on project characteristics
- Learns from previous projects to improve choices
- Provides fallback strategies when needed

### **Adaptive Execution Strategies**
- Optimizes between sequential, parallel, and hybrid approaches
- Auto-detects dependencies and optimizes task ordering
- Real-time bottleneck detection and resolution
- Dynamic scheduling based on progress monitoring

### **Proactive Problem Solving**
- Predicts common issues and provides preemptive solutions
- Applies learned patterns from successful projects
- Implements security-first approaches for sensitive features
- Suggests performance optimizations early

### **Continuous Learning**
- Tracks success patterns and learns from failures
- Updates knowledge base with each project
- Improves prompt generation and strategy over time
- Applies cross-project insights to new challenges

### **Factory Coordination**
- Requests Factory parallel execution with smart prompt engineering
- Provides comprehensive context and dependencies
- Monitors progress and handles bottlenecks
- Integrates results from all specialists

### **Real-time Monitoring**
- Progress tracking with milestone detection
- Performance metrics tracking and optimization
- Quality assurance with automatic validation
- Adaptive scheduling for optimal execution

### **Error Recovery**
- Auto-diagnoses execution failures with detailed analysis
- Provides alternative strategies and fallback approaches
- Implements graceful degradation when needed
- Learns from failures to prevent future issues

### **Knowledge Management**
- Stores successful patterns for reuse
- Documents failure scenarios to avoid
- Creates templates for common project types
- Improves strategy based on historical data
- Scans for tech stack patterns and dependencies
- Assesses complexity and risk factors automatically
- Predicts potential issues before they occur

### **Smart Droid Selection**
- Ranks specialists based on expertise and success history
- Adapts selection based on project characteristics
- Learns from previous projects to improve choices
- Provides fallback strategies when needed

### **Adaptive Execution Strategies**
- Optimizes between sequential, parallel, and hybrid approaches
- Auto-detects dependencies and optimizes task ordering
- Real-time bottleneck detection and resolution
- Dynamic scheduling based on progress monitoring

### **Proactive Problem Solving**
- Predicts common issues and provides preemptive solutions
- Applies learned patterns from successful projects
- Implements security-first approaches for sensitive features
- Suggests performance optimizations early

### **Continuous Learning**
- Tracks success patterns and learns from failures
- Updates knowledge base with each project
- Improves prompt generation and strategy over time
- Applies cross-project insights to new challenges

---

## 📁 Required Project Structure

For the orchestrator to work properly, your project needs:

### **Factory Assets (Required)**
```
your-project/
├── droids/                          # ✅ Copied from Factory (104 specialist droids)
│   ├── orchestrator.md               # ✅ Intelligent orchestrator droid
│   ├── backend-architect.md
│   ├── frontend-developer.md
│   ├── database-admin.md
│   ├── security-auditor.md
│   └── ... (100+ more specialists)
└── orchestrator/                    # ✅ Copied from Factory
    ├── orchestrator-config.json      # Quality gates and governance
    ├── task-patterns.json            # Predefined execution templates
    ├── context-manager.md             # Context management strategies
    └── automated-quality-gates.md    # Quality control processes
```

### **Optional Enhancements**
```
your-project/
├── commands/                        # ✅ Symlinked from Factory
│   └── orchestrator.md              # Smart orchestrator command
├── docs/                           # ✅ Symlinked from Factory
│   └── orchestrate-*.md             # Documentation and guides
└── tasks/                          # ✅ Created for project tracking
    ├── backend/DD-MM-YYYY/project-name/
    ├── frontend/DD-MM-YYYY/project-name/
    └── general/DD-MM-YYYY/project-name/
```

---

## 🔧 Manual Setup Instructions

### **1. Copy Factory Assets to Your Project**

**Option A: Using Copy Command (Recommended)**
```bash
# Navigate to your project directory
cd /path/to/your/project

# Copy droids directory
cp -r ~/.factory/droids ./droids

# Copy orchestrator directory
cp -r ~/.factory/orchestrator ./orchestrator

# Create task directories
mkdir -p tasks/{backend,frontend,general}

# Verify setup
ls -la droids/ orchestrator/ tasks/
```

**Option B: Using Symlinks (Development)**
```bash
# Navigate to your project directory
cd /path/to/your/project

# Create symlinks to Factory assets
ln -s ~/.factory/droids ./droids
ln -s ~/.factory/orchestrator ./orchestrator

# Create task directories
mkdir -p tasks/{backend,frontend,general}

# Verify setup
ls -la droids/ orchestrator/ tasks/
```

### **2. Verify Required Files**
Your project should have these key files:

```bash
# Check for orchestrator droid
ls droids/orchestrator.md

# Check for orchestrator configuration
ls orchestrator/orchestrator-config.json

# Check for task patterns
ls orchestrator/task-patterns.json

# Check for memory system
ls orchestrator/memory/success_patterns.json
```

### **3. Start Using the Orchestrator**

**Option A: Direct Droid Usage**
```bash
# Start Factory
factory

# Use the orchestrator directly
@orchestrator "Build your complex project here"
```

**Option B: Manual Orchestration**
```bash
# Create a new task directory
mkdir -p tasks/frontend/$(date +%d-%m-%YYYY)/my-project

# Create planning files
touch tasks/frontend/$(date +%d-%m-%YYYY)/my-project/{research.md,plan.md,files-edited.md,verification.md}

# Start orchestrating manually
factory
# Then invoke orchestrator with:
/droids/orchestrator.md "Your project description"
```

**Option C: Step-by-Step Manual Workflow**
```bash
# 1. Create task structure
mkdir -p tasks/backend/$(date +%d-%m-%YYYY)/project-name
cd tasks/backend/$(date +%d-%m-%YYYY)/project-name

# 2. Create planning files
echo "# Research" > research.md
echo "# Plan" > plan.md
echo "# Files Edited" > files-edited.md
echo "# Verification" > verification.md

# 3. Start Factory and work through phases
factory
# Follow the manual workflow outline in the documentation
```

### **4. Test Your Setup**

**Quick Test:**
```bash
# Start Factory
factory

# Test with a simple request
@orchestrator "Create a simple Hello World component in React"
```

**Verify Files:**
```bash
# Check that all required directories exist
ls -la droids/ orchestrator/ tasks/

# Check for key droids
ls droids/orchestrator.md droids/backend-architect.md droids/frontend-developer.md

# Check orchestrator memory
ls orchestrator/memory/
```

---

## 📋 Manual Workflow Overview

### **Step 1: Research & Planning**
```bash
# Create task directory
mkdir -p tasks/backend/$(date +%d-%m-%YYYY)/project-name

# Add your analysis to research.md
echo "## Project Analysis" > tasks/backend/$(date +%d-%m-%YYYY)/project-name/research.md
```

### **Step 2: Execution**
```bash
# Start Factory
factory

# Work through phases manually:
# 1. Use orchestrator for planning
# 2. Execute with specialist droids
# 3. Track progress in files-edited.md
```

### **Step 3: Quality Gates**
```bash
# Follow the manual quality checks defined in:
cat orchestrator/automated-quality-gates.md
```

### **Step 4: Synthesis**
```bash
# Document results in verification.md
echo "## Results" > tasks/backend/$(date +%d-%m-%YYYY)/project-name/verification.md
```

---

## 🎼 Usage Examples

### **Simple Project**
```bash
/orchestrator "Add user authentication with JWT tokens"
```
- Auto-detects: Next.js + TypeScript + PostgreSQL
- Strategy: Parallel security-first approach
- Coordinates: @security-auditor + @backend-architect + @frontend-developer

### **Complex Multi-Domain Project**
```bash
/orchestrator "Build complete e-commerce platform with payments"
```
- Auto-detects: React + Node.js + PostgreSQL + Stripe
- Strategy: Hybrid approach with security checkpoints
- Coordinates: 6+ specialist droids with intelligent scheduling

### **Performance Optimization**
```bash
/orchestrator "Optimize slow database queries and API response times"
```
- Auto-analyzes: Database schema, API endpoints, query patterns
- Strategy: Sequential with performance testing
- Coordinates: @database-admin + @backend-architect + @performance-engineer

---

## 🧠 How the Smart Orchestrator Works

### **Execution Flow:**
```
/orchestrator "Your project description"
    ↓
1. Project Analysis (Automatic)
   - Scan project files for tech stack detection
   - Analyze dependencies and complexity
   - Assess risk factors and constraints
   - Learn from similar projects
    ↓
2. Intelligent Planning
   - Select optimal execution strategy
   - Choose best specialist droids (auto-ranked)
   - Create adaptive phase plan with checkpoints
   - Generate proactive issue prevention
    ↓
3. Smart Delegation
   - Create enhanced prompts with best practices
   - Request Factory parallel execution
   - Provide comprehensive context and dependencies
   - Include monitoring and quality gates
    ↓
4. Factory Execution
   - Launch multiple specialist droids in parallel
   - Manage coordination and context passing
   - Monitor progress and handle bottlenecks
   - Execute error recovery when needed
    ↓
5. Integration & Learning
   - Synthesize results from all specialists
   - Apply quality gates and validation
   - Update knowledge base with learnings
   - Generate comprehensive documentation
```

### **Smart Features in Action:**

**Project Type Detection:**
```bash
Input: "Build a blog with comments"
Analysis: package.json → Next.js + TypeScript + MDX
Strategy: Parallel frontend + backend + content
Optimization: Include SEO and performance considerations
```

**Risk Prediction:**
```bash
Input: "Payment processing system"
Prediction: High risk - PCI compliance, security complexity
Prevention: Security-first approach, early audit, multiple payment gateways
Coordination: Security auditor involved from Phase 1
```

**Learning Integration:**
```bash
Previous Project: "JWT authentication system" → Success pattern: "Security-first approach"
Current Project: "User authentication" 
Application: Apply security-first pattern, early security audit
Result: Avoids common security issues, improves success rate
```

---

## 📋 Task Tracking & Documentation

### **Automatic Task Organization**
The orchestrator creates structured task folders automatically:

```
tasks/
├── backend/DD-MM-YYYY/project-name/
│   ├── research.md              # Analysis findings and tech decisions
│   ├── plan.md                  # Detailed implementation plan
│   ├── files-edited.md          # Complete change log with line numbers
│   └── verification.md          # Test results and validation
├── frontend/DD-MM-YYYY/project-name/
│   ├── research.md
│   ├── plan.md
│   ├── files-edited.md
│   └── verification.md
└── general/DD-MM-YYYY/project-name/
    ├── research.md
    ├── plan.md
    ├── files-edited.md
    └── verification.md
```

### **Documentation Standards**
- **research.md**: Project analysis, tech stack decisions, requirements
- **plan.md**: Phase breakdown, specialist assignments, timeline
- **files-edited.md**: Complete change log with line ranges and descriptions
- **verification.md**: Test results, quality metrics, integration status

---

## 🛠️ Advanced Features

### **Error Recovery**
- Auto-diagnoses execution failures
- Provides alternative strategies and fallback approaches
- Implements graceful degradation when needed
- Learns from failures to prevent future issues

### **Performance Optimization**
- Real-time bottleneck detection and resolution
- Dynamic task reordering based on progress
- Performance metrics tracking and optimization
- Adaptive scheduling for optimal execution

### **Quality Assurance**
- Automatic quality gates at each checkpoint
- Security validation throughout the process
- Integration testing between components
- Continuous improvement based on feedback

### **Knowledge Management**
- Stores successful patterns for reuse
- Documents failure scenarios to avoid
- Creates templates for common project types
- Improves strategy based on historical data

---

## 🔍 Troubleshooting

### **Common Issues:**

**Command not found:**
```bash
# Add to shell config
echo 'alias orchestrate="$HOME/.factory/bin/orchestrate"' >> ~/.zshrc
source ~/.zshrc
```

**Missing droids/orchestrator:**
```bash
# Copy Factory assets to your project
cp -r ~/.factory/droids ./droids
cp -r ~/.factory/orchestrator ./orchestrator

# Verify installation
ls droids/orchestrator.md
ls orchestrator/orchestrator-config.json
```

**Factory cannot find droids:**
```bash
# Ensure you're in project directory with Factory assets
ls -la droids/ orchestrator/

# Restart Factory session
factory
```

**Orchestrator not working intelligently:**
```bash
# Verify Factory assets are properly copied
ls -la orchestrator/

# Check orchestrator configuration
cat orchestrator/orchestrator-config.json

# Test with simple project
/orchestrator "Create a simple Hello World component"
```

### **Getting Help:**

```bash
# Command help
/orchestrator --help

# Show available specialists
/orchestrator --list-droids

# System verification
/orchestrator --verify

# Display capabilities
/orchestrator --info
```

---

## 📚 Documentation References

- **`commands/orchestrator.md`** – Smart command documentation
- **`droids/orchestrator.md`** – Complete orchestrator droid definition
- **`orchestrator/orchestrator-config.json`** – Governance and quality settings
- **`orchestrator/task-patterns.json`** – Execution templates and patterns
- **`docs/orchestrate-command.md`** – Detailed CLI reference
- **`docs/orchestrate-quickstart.md`** – 5-minute setup guide

---

## 🚀 Advanced Usage

### **Custom Project Types**
The orchestrator automatically adapts to various project types:
- **Web Applications**: React, Next.js, Vue, Angular
- **Backend Systems**: Node.js, Python, Ruby, PHP
- **Mobile Apps**: React Native, Flutter, Swift, Kotlin
- **Data Platforms**: Analytics, ML pipelines, ETL systems
- **DevOps/Infrastructure**: Docker, Kubernetes, CI/CD, Cloud

### **Industry-Specific Patterns**
Built-in knowledge for:
- **E-commerce**: PCI compliance, payment integration, inventory management
- **SaaS Applications**: Multi-tenancy, subscription billing, user management
- **Healthcare**: HIPAA compliance, data privacy, audit trails
- **Finance**: Security standards, regulatory compliance, risk management
- **Education**: LMS integration, user roles, content management

### **Performance Optimization**
- **Database**: Query optimization, indexing strategies, connection pooling
- **API**: Response time optimization, caching strategies, load balancing
- **Frontend**: Bundle optimization, lazy loading, code splitting
- **Infrastructure**: Auto-scaling, CDN integration, monitoring

---

## 🎉 Ready to Orchestrate Smartly!

The intelligent orchestrator combines AI-powered analysis with Factory's execution capabilities to deliver:

- ✅ **Smarter Planning** - Automatic project analysis and strategy optimization
- ✅ **Better Coordination** - Intelligent specialist selection and parallel execution
- ✅ **Proactive Problem Solving** - Issue prediction and preemptive solutions
- ✅ **Continuous Improvement** - Learning from every project to enhance future performance
- ✅ **Quality Assurance** - Built-in monitoring, testing, and validation
- ✅ **Documentation** - Comprehensive tracking and knowledge management

Start orchestrating your projects with intelligence today! 🚀

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
├── tasks/                           # Research/planning/verification artifacts per task
└── …                                # Supporting config/history files
```
