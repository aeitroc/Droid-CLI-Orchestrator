# Orchestrator Execution Flow

## Visual Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                     USER INVOKES /orchestrator                       │
└────────────────────────────────┬────────────────────────────────────┘
                                 │
                                 ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    COMMAND LOADED (JSON Context)                     │
│  • System Structure: /droids/, /orchestrator/                       │
│  • Available Droids: 104 specialists categorized                    │
│  • Execution Flow: 7-step sequence                                  │
│  • Key Principles: Organic discovery, no hardcoded assumptions      │
└────────────────────────────────┬────────────────────────────────────┘
                                 │
                                 ▼
╔═════════════════════════════════════════════════════════════════════╗
║                          LAYER 1: DISCOVERY                          ║
╚═════════════════════════════════════════════════════════════════════╝
                                 │
                    ┌────────────┴────────────┐
                    ▼                         ▼
         ┌──────────────────┐      ┌──────────────────┐
         │ Read Project     │      │ Read Orchestrator│
         │ Context Files    │      │ Configuration    │
         │                  │      │                  │
         │ • README.md      │      │ • task-patterns  │
         │ • plan.md        │      │ • config.json    │
         │ • package.json   │      │ • patterns       │
         │ • src/           │      │                  │
         └────────┬─────────┘      └────────┬─────────┘
                  │                         │
                  └────────────┬────────────┘
                               ▼
                    ┌─────────────────────┐
                    │ Context Assembled   │
                    │ • Project type      │
                    │ • Tech stack        │
                    │ • Requirements      │
                    │ • Constraints       │
                    └──────────┬──────────┘
                               │
                               ▼
╔═════════════════════════════════════════════════════════════════════╗
║                         LAYER 2: PLANNING                            ║
╚═════════════════════════════════════════════════════════════════════╝
                               │
                    ┌──────────┴──────────┐
                    ▼                     ▼
         ┌─────────────────┐   ┌─────────────────────┐
         │ Analyze Scope   │   │ Select Strategy     │
         │                 │   │                     │
         │ • Complexity    │   │ • Sequential        │
         │ • Domains       │   │ • Parallel          │
         │ • Dependencies  │   │ • Hybrid            │
         └────────┬────────┘   └──────────┬──────────┘
                  │                       │
                  └───────────┬───────────┘
                              ▼
                   ┌────────────────────┐
                   │ Break into Phases  │
                   │                    │
                   │ Phase 1: Setup     │
                   │ Phase 2: Backend   │
                   │ Phase 3: Frontend  │
                   │ Phase 4: Testing   │
                   │ Phase 5: Deploy    │
                   └──────────┬─────────┘
                              │
                              ▼
                   ┌────────────────────┐
                   │ Map Droids to      │
                   │ Each Phase         │
                   │                    │
                   │ Setup → DevOps     │
                   │ Backend → Arch     │
                   │ Frontend → Dev     │
                   │ Testing → QA       │
                   └──────────┬─────────┘
                              │
                              ▼
                   ┌────────────────────┐
                   │ CREATE TODOWRITE   │
                   │                    │
                   │ ✓ All phases       │
                   │ ✓ All sub-tasks    │
                   │ ✓ Dependencies     │
                   │ ✓ Priorities       │
                   └──────────┬─────────┘
                              │
                              ▼
╔═════════════════════════════════════════════════════════════════════╗
║                     LAYER 3: IMPLEMENTATION                          ║
╚═════════════════════════════════════════════════════════════════════╝
                              │
              ┌───────────────┴───────────────┐
              ▼                               ▼
   ┌─────────────────────┐         ┌─────────────────────┐
   │ PHASE 1: SETUP      │         │ Sequential or       │
   │                     │         │ Parallel Execution  │
   │ Task(               │         │                     │
   │   subagent_type:    │         │ Based on            │
   │   "devops-...",     │         │ Dependencies        │
   │   description: "...",│         │                     │
   │   prompt: "..."     │         │                     │
   │ )                   │         │                     │
   └──────────┬──────────┘         └─────────────────────┘
              │
              ▼
   ┌─────────────────────┐
   │ Droid Returns       │
   │ • Code changes      │
   │ • Config files      │
   │ • Documentation     │
   └──────────┬──────────┘
              │
              ▼
   ┌─────────────────────┐
   │ Update TodoWrite    │
   │ Phase 1: ✓ Complete │
   └──────────┬──────────┘
              │
              ▼
   ┌─────────────────────┐
   │ PHASE 2: BACKEND    │
   │                     │
   │ Task(               │
   │   subagent_type:    │
   │   "backend-arch",   │
   │   context: {        │
   │     phase1_output   │
   │   }                 │
   │ )                   │
   └──────────┬──────────┘
              │
              ▼
   ┌─────────────────────┐
   │ Context Passing     │
   │                     │
   │ • Previous outputs  │
   │ • API contracts     │
   │ • Design decisions  │
   │ • Tech constraints  │
   └──────────┬──────────┘
              │
              ▼
        [Continue for all phases...]
              │
              ▼
   ┌─────────────────────┐
   │ All Phases Complete │
   │ Phase 1: ✓          │
   │ Phase 2: ✓          │
   │ Phase 3: ✓          │
   │ Phase 4: ✓          │
   │ Phase 5: ✓          │
   └──────────┬──────────┘
              │
              ▼
╔═════════════════════════════════════════════════════════════════════╗
║                   LAYER 4: REVIEW & VALIDATION                       ║
╚═════════════════════════════════════════════════════════════════════╝
              │
    ┌─────────┼─────────┐
    ▼         ▼         ▼
┌────────┐ ┌──────┐ ┌──────────┐
│Security│ │Code  │ │Integration│
│Review  │ │Review│ │Testing    │
│        │ │      │ │           │
│Task(   │ │Task( │ │Task(      │
│"sec-   │ │"code-│ │"test-     │
│auditor"│ │review│ │automator" │
│)       │ │")    │ │)          │
└───┬────┘ └──┬───┘ └─────┬─────┘
    │         │           │
    └─────────┼───────────┘
              ▼
   ┌─────────────────────┐
   │ Collect Issues      │
   │                     │
   │ • Security gaps     │
   │ • Code quality      │
   │ • Test failures     │
   │ • Integration bugs  │
   └──────────┬──────────┘
              │
              ▼
         ┌────┴────┐
         │ Issues? │
         └────┬────┘
              │
         Yes  │  No
    ┌─────────┴─────────┐
    ▼                   ▼
┌────────────┐   ┌──────────────┐
│ Create Fix │   │ Proceed to   │
│ Todos      │   │ Synthesis    │
│            │   │              │
│ Delegate   │   └──────┬───────┘
│ to Fixers  │          │
└─────┬──────┘          │
      │                 │
      └────────┬────────┘
               ▼
╔═════════════════════════════════════════════════════════════════════╗
║                         FINAL SYNTHESIS                              ║
╚═════════════════════════════════════════════════════════════════════╝
               │
               ▼
    ┌─────────────────────┐
    │ Integration Check   │
    │                     │
    │ • Files compatible  │
    │ • APIs aligned      │
    │ • Tests pass        │
    │ • Deployment ready  │
    └──────────┬──────────┘
               │
               ▼
    ┌─────────────────────┐
    │ Generate Summary    │
    │                     │
    │ • What was built    │
    │ • Files created     │
    │ • Files modified    │
    │ • Next steps        │
    │ • Documentation     │
    └──────────┬──────────┘
               │
               ▼
    ┌─────────────────────┐
    │ Update TodoWrite    │
    │ All tasks: ✓        │
    └──────────┬──────────┘
               │
               ▼
┌─────────────────────────────────────────────────────────────────────┐
│                      PROJECT COMPLETE ✓                              │
│                                                                      │
│  • All phases executed                                              │
│  • All droids coordinated                                           │
│  • All outputs integrated                                           │
│  • Quality gates passed                                             │
│  • Documentation generated                                          │
└─────────────────────────────────────────────────────────────────────┘
```

## Detailed Flow Explanation

### 1. **Initialization**
```
User: /orchestrator
  ↓
Load: /commands/orchestrator.md (JSON context)
  ↓
Parse: System structure, droids, execution flow
```

### 2. **Layer 1: Discovery**
```
Goal: Understand the project
  ↓
Actions:
  1. Read project files (README, plan.md, package.json, etc.)
  2. Read orchestrator config (/orchestrator/task-patterns.json)
  3. Analyze tech stack and requirements
  ↓
Output: Complete project context
```

### 3. **Layer 2: Planning**
```
Goal: Create execution strategy
  ↓
Actions:
  1. Determine complexity (simple/medium/complex)
  2. Identify domains (backend, frontend, mobile, etc.)
  3. Break into phases with dependencies
  4. Map specialist droids to each phase
  5. Create TodoWrite with all tasks
  ↓
Output: Execution plan with todos
```

### 4. **Layer 3: Implementation**
```
Goal: Execute the plan
  ↓
For each phase:
  1. Delegate to appropriate droid using Task tool
     Task(
       subagent_type: "backend-architect",
       description: "Design API endpoints",
       prompt: "Create RESTful API with context from phase 1..."
     )
  2. Droid executes and returns results
  3. Pass context to next phase
  4. Update TodoWrite (mark complete)
  ↓
Output: Implemented features
```

### 5. **Layer 4: Review & Validation**
```
Goal: Ensure quality
  ↓
Actions:
  1. Security audit → Task("security-auditor")
  2. Code review → Task("code-reviewer")
  3. Integration testing → Task("test-automator")
  4. Collect issues
  5. Fix if needed, or proceed
  ↓
Output: Validated, quality-checked code
```

### 6. **Final Synthesis**
```
Goal: Complete and document
  ↓
Actions:
  1. Verify all components integrate
  2. Generate summary report
  3. Update all TodoWrite items to complete
  4. Provide next steps
  ↓
Output: Complete project + documentation
```

## Example: Building Authentication System

```
/orchestrator
  ↓
Layer 1: Discovery
  - Read plan.md: "Build JWT authentication with refresh tokens"
  - Tech stack: Node.js + TypeScript + PostgreSQL + React
  - Requirements: Secure, scalable, tested
  ↓
Layer 2: Planning
  - Complexity: Medium (2-3 droids)
  - Strategy: Sequential pipeline
  - Phases:
    1. Database schema (database-architect)
    2. Backend API (backend-typescript-architect)
    3. Security review (security-auditor)
    4. Frontend components (frontend-developer)
    5. Testing (test-automator)
  - Create todos with all sub-tasks
  ↓
Layer 3: Implementation
  Phase 1: Task("database-architect")
    → Creates users table, tokens table, migrations
  Phase 2: Task("backend-typescript-architect", context: {db_schema})
    → Creates /login, /register, /refresh endpoints
    → JWT generation, validation middleware
  Phase 3: Task("security-auditor", context: {api_endpoints})
    → Reviews for SQL injection, XSS, CSRF
    → Validates encryption, token expiry
  Phase 4: Task("frontend-developer", context: {api_contracts})
    → Login form, registration form, protected routes
    → Token storage, auto-refresh logic
  Phase 5: Task("test-automator", context: {all_components})
    → Unit tests, integration tests, E2E tests
  ↓
Layer 4: Review
  - Code review → Task("code-reviewer")
  - Final security check → Task("security-auditor")
  - Issues found: none
  ↓
Final Synthesis
  - All components integrated
  - 23 files created, 5 modified
  - 89% test coverage
  - Documentation generated
  ✓ Complete
```

## Key Characteristics

### **Autonomous Execution**
- No user intervention needed between phases
- Orchestrator manages entire flow
- Droids coordinate automatically

### **Context Propagation**
```
Phase 1 Output → Phase 2 Input
Phase 2 Output → Phase 3 Input
...
All Outputs → Final Synthesis
```

### **Error Handling**
```
Error in Phase 3
  ↓
Analyze failure
  ↓
Retry with adjusted prompt
  OR
  ↓
Delegate to different droid
  OR
  ↓
Ask user for clarification
```

### **Quality Gates**
```
After Implementation
  ↓
Security Check (must pass)
  ↓
Code Review (must pass)
  ↓
Integration Tests (must pass)
  ↓
Proceed to Synthesis
```

## Execution Strategies

### **Sequential Pipeline**
```
Phase 1 → Phase 2 → Phase 3 → Result
Use when: Clear dependencies
Example: Schema → API → Frontend
```

### **Parallel Execution**
```
         Phase 1
            ↓
    ┌───────┼───────┐
    ▼       ▼       ▼
  Droid A  Droid B  Droid C
    └───────┼───────┘
            ↓
        Synthesis
Use when: Independent tasks
Example: Docs + Tests + UI (parallel)
```

### **Hybrid Strategy**
```
Phase 1 (sequential)
    ↓
Phase 2a + 2b (parallel)
    ↓
Phase 3 (sequential)
Use when: Mix of dependencies
Example: Setup → (Backend + Frontend) → Integration
```

