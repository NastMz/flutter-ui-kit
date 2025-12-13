# Copilot Instructions (Repo)

## Objective

Build a reusable Flutter UI library with token-first theming and stable public APIs.

## Non-negotiables

- No hardcoded styling (colors, typography, spacing). Use tokens from `packages/core`.
- Prefer composition over configuration flags.
- Public widgets must have predictable defaults and be documented.
- Keep `core` independent from `components`. `components` may depend on `core`, not vice versa.

## Commands

- Analyze: `melos run analyze`
- Test: `melos run test`
- Format: `melos run format`

## Quality bar

- If behavior is unclear, create an issue and add a TODO with exact intent and acceptance criteria.

## Component rules

Follow docs/component-policy.md for any work in packages/components.

## Role instructions

- For work in packages/core: follow .github/instructions/core.instructions.md
- For work in packages/components: follow .github/instructions/components.instructions.md
- For docs changes: follow .github/instructions/docs.instructions.md
