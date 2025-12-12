# Architecture Overview

This repository implements a monorepo Flutter UI system designed to provide
reusable, themeable, and composable UI components.

## Repository Structure

- apps/showcase: visual catalog and integration app
- packages/core: design tokens, theming, foundations
- packages/components: UI widgets built on top of core
- packages/experimental: non-stable experiments

## Dependency Rules (Non-Negotiable)

- `core`

  - ❌ Must NOT depend on `components`
  - ❌ Must NOT depend on any app
  - ✅ May depend on Flutter SDK primitives only

- `components`

  - ✅ May depend on `core`
  - ❌ Must NOT depend on any app

- `apps/showcase`
  - ✅ May depend on `components` and `core`
  - ❌ Must NOT expose reusable logic

Any violation of these rules requires a formal ADR.

---

## Design Principles

1. **Token-first**

   - No component defines colors, spacing, typography, or radii directly.
   - All visual decisions come from tokens defined in `core`.

2. **Composition over configuration**

   - Prefer widget composition instead of boolean flags or large parameter lists.

3. **Flutter-idiomatic**

   - APIs must feel native to Flutter, not ported from React or web systems.

4. **Opt-in adoption**
   - Consumers may import individual components without adopting the full system.

---

## Public API Policy

- Only explicitly exported symbols are considered public.
- Breaking changes require:
  - Version bump
  - CHANGELOG entry
  - Migration notes (if applicable)

---

## Tooling

- Monorepo orchestration: **Melos**
- Workspace resolution: **Dart pub workspaces**
- Editor baseline: **VS Code workspace configuration**
