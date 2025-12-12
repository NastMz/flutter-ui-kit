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
