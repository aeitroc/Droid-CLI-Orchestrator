# Context Manager for Factory CLI Orchestrator

## Overview

The Context Manager provides a structured way to share and maintain context across orchestrated droid tasks. It ensures that each droid has access to relevant information from previous phases and that the orchestrator can synthesize results effectively.

## Context Structure

### Main Context Template

```json
{
  "task_id": "unique-task-identifier",
  "user_request": "original user request",
  "execution_plan": {
    "pattern_id": "full-stack-feature",
    "complexity": "medium",
    "estimated_duration": "45-60 minutes",
    "strategy": "hybrid",
    "phases": [...]
  },
  "current_phase": "implementation",
  "completed_phases": ["architecture", "security-review"],
  "shared_artifacts": {
    "file_paths": {
      "created": [],
      "modified": [],
      "referenced": []
    },
    "api_contracts": {},
    "database_schemas": {},
    "design_decisions": {},
    "technical_constraints": {},
    "user_requirements": {},
    "security_requirements": {},
    "performance_requirements": {}
  },
  "droid_outputs": {
    "backend-architect": {
      "status": "completed",
      "duration": "12 minutes",
      "files_created": ["src/api/schema.json", "docs/api-design.md"],
      "key_decisions": [],
      "next_phase_requirements": [],
      "integration_points": {},
      "dependencies": {}
    }
  },
  "execution_log": [
    {
      "timestamp": "2024-10-17T14:30:00Z",
      "phase": "architecture",
      "droid": "backend-architect",
      "action": "started",
      "notes": "Task delegated with full requirements"
    }
  ],
  "quality_metrics": {
    "code_quality": {},
    "test_coverage": {},
    "security_assessment": {},
    "performance_metrics": {}
  },
  "synthesis_status": {
    "integration_conflicts": [],
    "missing_components": [],
    "quality_gates": [],
    "ready_for_delivery": false
  }
}
```

## Context Passing Rules

### What Always Gets Passed Between Phases

#### 1. File Paths and Locations
```json
{
  "shared_artifacts": {
    "file_paths": {
      "created": [
        {
          "path": "src/api/auth.ts",
          "purpose": "Authentication API endpoints",
          "phase": "implementation",
          "droid": "backend-typescript-architect"
        }
      ],
      "modified": [
        {
          "path": "src/db/index.ts",
          "purpose": "Added auth connection configuration",
          "phase": "implementation",
          "droid": "backend-typescript-architect"
        }
      ]
    }
  }
}
```

#### 2. API Contracts and Interfaces
```json
{
  "shared_artifacts": {
    "api_contracts": {
      "auth": {
        "endpoints": [
          {
            "method": "POST",
            "path": "/api/auth/login",
            "request_body": {
              "email": "string",
              "password": "string"
            },
            "response": {
              "token": "string",
              "user": "object"
            }
          }
        ],
        "base_url": "/api",
        "version": "v1"
      }
    }
  }
}
```

#### 3. Database Schemas
```json
{
  "shared_artifacts": {
    "database_schemas": {
      "users_table": {
        "name": "users",
        "columns": [
          {"name": "id", "type": "uuid", "primary_key": true},
          {"name": "email", "type": "varchar", "unique": true},
          {"name": "password_hash", "type": "varchar"},
          {"name": "created_at", "type": "timestamp"}
        ],
        "indexes": [
          {"name": "idx_users_email", "columns": ["email"]}
        ]
      }
    }
  }
}
```

#### 4. Design Decisions
```json
{
  "shared_artifacts": {
    "design_decisions": {
      "authentication_strategy": {
        "decision": "JWT with refresh tokens",
        "reasoning": "Balanced security and performance",
        "alternatives_considered": ["Session-based auth", "OAuth2 with external providers"],
        "phase": "security-review",
        "droid": "security-auditor"
      }
    }
  }
}
```

## Droid Context Requirements

### Each Droid Must Provide

#### Backend Droids (backend-architect, backend-typescript-architect)
- API endpoints with request/response schemas
- Database schema changes or requirements
- Integration points with other systems
- Security considerations
- Performance requirements

#### Frontend Droids (frontend-developer, ui-ux-designer)
- Component hierarchy and structure
- State management approach
- API integration requirements
- User experience considerations
- Accessibility requirements

#### Security Droids (security-auditor)
- Security requirements and constraints
- Authentication/authorization flows
- Data protection requirements
- Compliance requirements
- Security testing requirements

#### Testing Droids (test-automator)
- Test coverage requirements
- Testing strategy and frameworks
- Mock/stub requirements
- Environment setup needs
- Performance testing requirements

## Context Generation Templates

### Phase Completion Template

```yaml
# Template for droid phase completion
phase_completion:
  status: completed | failed | blocked
  duration: "X minutes"
  
  deliverables:
    files_created:
      - path: "path/to/file"
        purpose: "brief description"
        dependencies: []
    files_modified:
      - path: "path/to/file"
        changes: "brief description"
        
  key_decisions:
    - decision: "Decision made"
      reasoning: "Why this decision"
      alternatives_considered: ["option1", "option2"]
      
  next_phase_requirements:
    - requirement: "What next phase needs"
      for_droid: "Which droid needs this"
      
  integration_points:
    - component: "Component name"
      with: "Other component or system"
      interface: "How they connect"
      
  blockers:
    - blocker: "What's blocking progress"
      required_action: "What needs to happen"
      
  suggestions:
    - suggestion: "Recommendation for orchestration"
      rationale: "Why this is recommended"
```

## Context Preservation Strategies

### 1. File-Based Context Storage
```typescript
// Save context after each phase
interface PhaseContext {
  phase_id: string;
  droid: string;
  timestamp: string;
  outputs: any;
  next_phase_requirements: any;
}

// Context is saved to ~/.factory/orchestrator/contexts/[task_id].json
```

### 2. In-Memory Context Passing
```typescript
// During active orchestration, context is passed in Task tool prompts
Task(
  subagent_type: "frontend-developer",
  description: "Build login UI",
  prompt: `
    Context from previous phases:
    ${JSON.stringify(context.shared_artifacts, null, 2)}
    
    Build a login form that integrates with the auth API at /api/auth/login
    Use the user schema with email/password fields as defined in database schema
  `
)
```

### 3. Artifact Tracking
```typescript
interface Artifact {
  type: "file" | "api" | "schema" | "decision";
  name: string;
  phase: string;
  droid: string;
  description: string;
  dependencies: string[];
  consumers: string[]; // Which phases/droids use this
}
```

## Conflict Resolution

### Detecting Integration Conflicts

1. **API Contract Mismatches**
   - Frontend expects different data structure than backend provides
   - Different authentication schemes between components

2. **Schema Conflicts**
   - Database changes break existing code
   - Conflicting data models between services

3. **Design Pattern Conflicts**
   - Different architectural patterns in same system
   - Inconsistent coding standards

### Conflict Resolution Process

```typescript
interface Conflict {
  type: "api_contract" | "schema" | "design" | "dependency";
  severity: "critical" | "high" | "medium" | "low";
  description: string;
  affected_components: string[];
  resolution_strategy: "reconcile" | "choose_one" | "merge" | "escalate";
  suggested_resolution: string;
}
```

## Quality Gates

### Context Quality Checks

#### 1. Completeness Check
```typescript
function validateContextCompleteness(context: PhaseContext): boolean {
  const required_fields = [
    "files_created",
    "key_decisions", 
    "next_phase_requirements",
    "integration_points"
  ];
  
  return required_fields.every(field => context[field] !== undefined);
}
```

#### 2. Consistency Check
```typescript
function validateConsistency(context: OrchestratorContext): Conflict[] {
  const conflicts = [];
  
  // Check API contract consistency
  conflicts.push(...checkApiContracts(context));
  
  // Check database schema consistency
  conflicts.push(...checkSchemaConsistency(context));
  
  // Check design pattern consistency
  conflicts.push(...checkDesignConsistency(context));
  
  return conflicts;
}
```

#### 3. Integration Readiness Check
```typescript
function validateIntegrationReadiness(context: OrchestratorContext): {
  ready: boolean;
  blockers: string[];
  recommendations: string[];
} {
  // Check if all integration points have corresponding implementations
  // Verify that dependencies are satisfied
  // Validate that quality gates are met
}
```

## Context Sharing Examples

### Example 1: Authentication Feature Context Flow

#### Phase 1: Security Audit (security-auditor)
```json
{
  "shared_artifacts": {
    "security_requirements": {
      "authentication": {
        "method": "JWT",
        "token_expiry": "15 minutes",
        "refresh_token": "7 days",
        "encryption": "AES-256"
      },
      "password_policy": {
        "min_length": 8,
        "require_special_chars": true,
        "require_numbers": true
      }
    }
  }
}
```

#### Phase 2: Backend Architecture (backend-architect)
```json
{
  "shared_artifacts": {
    "api_contracts": {
      "auth": {
        "login": {
          "endpoint": "POST /api/auth/login",
          "request": {"email": "string", "password": "string"},
          "response": {"token": "string", "user": "object", "refresh_token": "string"}
        }
      }
    },
    "database_schemas": {
      "users": {
        "table": "users",
        "columns": [
          {"name": "id", "type": "uuid"},
          {"name": "email", "type": "varchar", "unique": true},
          {"name": "password_hash", "type": "varchar"}
        ]
      }
    }
  }
}
```

#### Phase 3: Implementation (backend-typescript-architect + frontend-developer)
```json
{
  "shared_artifacts": {
    "file_paths": {
      "created": [
        {"path": "src/api/auth.ts", "droid": "backend-typescript-architect"},
        {"path": "src/components/auth/LoginForm.tsx", "droid": "frontend-developer"}
      ]
    },
    "implementation_details": {
      "backend": {
        "uses_jwt": true,
        "bcrypt_password_hashing": true,
        "rate_limiting": "100/min"
      },
      "frontend": {
        "uses_nextauth": true,
        "form_validation": "zod",
        "token_storage": "localStorage"
      }
    }
  }
}
```

## Implementation Notes

### Layer Snapshots & Context Persistence

- Context is stored in `~/.factory/orchestrator/contexts/`
- Each task gets its own context file: `[task_id].json`
- Before each execution layer begins, persist a snapshot (e.g., `layer-<n>-context.json`).
- Context is versioned after each layer completion.
- Historical context is retained for 7 days.

### Context Recovery

- If orchestration is interrupted, context can be resumed
- Phase completion states are checkpointed
- Failed phases can be retried with preserved context

### Context Validation

- Automatic validation after each phase
- Integration conflict detection
- Quality gate enforcement
- Readiness assessment for synthesis

---

This context management system ensures that information flows smoothly between orchestrated droids and that complex multi-phase tasks maintain coherence throughout execution! 🔄
