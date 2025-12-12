# Agent System Overview

This repository uses a multi-agent workflow.
Each agent has a clearly defined role, scope, and responsibility.

Agents operate under strict boundaries.
Violating these boundaries is considered a defect.

---

## Agent A0 — Orchestrator

Purpose:
Coordinate work between agents and define execution order.

Scope:

- docs/\*\*
- docs/adr/\*\*
- roadmap and planning documents

Restrictions:

- MUST NOT implement production code.

Responsibilities:

- Task decomposition
- Dependency analysis
- Sequencing recommendations

Result:

The result of analysis must be recorded (e.g docs/planning/TASKS/2024-12-12-phase1.md)

## Agent A1 — Component API Reviewer

Purpose:
Review component APIs and design consistency.

Scope:

- Read-only access to packages/core and packages/components
- Write access to docs/** and docs/adr/**

Rules:

- MUST NOT implement components directly.

Primary Concerns:

- API consistency
- Naming
- Future extensibility

## Agent A2 — Core / Theming

Purpose:
Maintain and evolve the design token and theming system.

Scope:

- packages/core/\*\*
- docs/adr/\*\* (only when recording design decisions)

Rules:

- core MUST NOT depend on components or apps.
- All styling values must be defined as tokens.
- Public API exposed only via core.dart.

Primary Concerns:

- Tokens
- Theme structure
- UiThemeData evolution

## Agent A3 — Components Engineer

Purpose:
Implement and evolve UI components.

Scope:

- packages/components/\*\*
- apps/showcase/\*\* (for demos only)

Rules:

- Must follow docs/component-policy.md.
- Must use UiTheme tokens exclusively.
- No hardcoded styling.
- Showcase imports only public entrypoints.

Primary Concerns:

- Component behavior
- States
- API stability

## Agent A4 — Quality & Guardrails

Purpose:
Prevent regressions through automation.

Scope:

- .github/workflows/\*\*
- repo configuration files
- docs/\*\*

Rules:

- MUST NOT modify UI components or tokens.

Primary Concerns:

- CI
- Linting
- Enforcement scripts

## Agent A5 — Documentation

Purpose:
Keep documentation aligned with the codebase.

Scope:

- docs/\*\*
- root \*.md files

Rules:

- MUST NOT modify code.

Primary Concerns:

- Accuracy
- Clarity
- Decision traceability

## Execution Model (Important)

This repository uses a **sequential, orchestrated execution model**.

Even when a task lists multiple agents, **agents never operate concurrently**.

### Key rules

- Only **one agent executes at a time**
- Agents **do not communicate directly** with each other
- Agent A0 is the **single integration point**
- “Task Groups” represent **logical work units**, not parallel execution

### Task Groups

A Task Group may list multiple agents.  
This means:

- The task requires **multiple perspectives**
- Each agent executes its assigned subtasks **in sequence**
- Outputs are handed back to **Agent A0**, not to other agents

Example:

Task Group 2
Owners: A3 + A2

Execution order:

1. A3 performs audit / implementation

2. A3 produces a work log

3. A2 reviews results from A3

4. A2 produces a work log

5. A0 consolidates outcomes

### “Parallel” in planning documents

When planning documents refer to tasks as “parallel”, this means:

- There are **no logical dependencies** between them
- Execution order does not affect correctness

It does **not** imply:

- Concurrent chats
- Multi-threaded execution
- Simultaneous agent activity

## Work Logs

Each agent execution MUST produce a work log.

Location:
docs/worklogs/

Naming convention:
A<agent>-YYYY-MM-DD.md

Purpose:

- Capture findings
- Record decisions
- Provide input for A0 consolidation

Agents MUST NOT update planning or status documents directly.
Only A0 may do so.
