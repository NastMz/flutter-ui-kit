# Component Policy

This document defines the rules for building and evolving UI components in this repo.

## 1. Public API

- Only symbols exported from `packages/components/lib/components.dart` are considered public.
- Components must:
  - provide sensible defaults
  - avoid breaking changes without a version bump + ADR (when needed)
- Prefer small enums over booleans for variants and sizes.

## 2. Tokens and Styling

- Components MUST use `UiTheme.of(context)` and its token sets.
- Components MUST NOT hardcode:
  - colors
  - spacing
  - typography
  - radii
- Every shadcn/ui design token (color, radius, typography, spacing) must map to a Ui token. Keep the mapping table below up to date whenever you add or rename tokens.
- Exceptions:
  - transparent (`Colors.transparent`) is allowed when semantically required
  - white/black should be avoided unless explicitly justified (prefer tokens)

### 2.1 Token Mapping Snapshot

> Generated from `docs/shadcn_parity_manifest.json`. Run `dart tooling/shadcn_parity/sync.dart` after editing the manifest.

<!-- BEGIN:token-mapping -->

| shadcn token    | Ui token          | Status | Notes                                  |
| --------------- | ----------------- | ------ | -------------------------------------- |
| `--radius-sm`   | UiRadiusTokens.sm | ✅     | Keeps button corner radius aligned     |
| `--ring-offset` | _TODO_            | ☐      | Add tokens before shipping focus rings |

<!-- END:token-mapping -->

## 3. States

- Interactive components should handle states:
  - disabled
  - hovered (desktop/web)
  - pressed
  - focused (for inputs)
  - error (when applicable)
- State handling should use `MaterialStateProperty` where possible.

## 4. Structure

- Each component family has its own folder:
  - `buttons/`, `inputs/`, `surfaces/`, etc.
- Each family must have a barrel export:
  - `buttons/buttons.dart`, `inputs/inputs.dart`, ...
- `components.dart` is the single public entrypoint.

## 5. Naming

- Public widgets use the `Ui` prefix: `UiButton`, `UiCard`, `UiTextField`.
- Enums use the component prefix: `UiButtonVariant`, `UiCardPadding`, etc.

## 6. Documentation

- Every public component must have:
  - at least one example in `apps/showcase`
  - a short doc comment explaining intent and key parameters

## 7. Shadcn Parity Checklist

- Mirror the shadcn/ui API surface where it improves ergonomics (names, props, interaction states). Deviations must explain _why_ and link to an ADR or issue.
- Implement shadcn variants, sizes, and compound states before calling a component “done”.
- Showcase examples should cover every supported variant to keep parity reviewable.
- Update the Component Coverage table whenever status changes.

### 7.1 Component Coverage

> Generated from `docs/shadcn_parity_manifest.json`. Run `dart tooling/shadcn_parity/sync.dart` after editing the manifest.

<!-- BEGIN:component-coverage -->

| Component | Flutter widget | Status | Notes                                       |
| --------- | -------------- | ------ | ------------------------------------------- |
| Alert     | UiAlert        | ☐      | Pending implementation                      |
| Badge     | _TODO_         | ☐      | Track design + tokens                       |
| Button    | UiButton       | ✅     | Parity with solid/outline/ghost             |
| Input     | UiTextField    | ⚙️     | Needs icon slot + error helper text mapping |

<!-- END:component-coverage -->

> Update this table as soon as a component’s public API or behavior changes.

## 8. Testing

- Write widget tests for every interactive state (default, hover, focus, pressed, disabled, error when relevant).
- Add golden tests for new visual states or variants to guard against regressions when tokens evolve.
- For accessibility-critical components (inputs, dialogs), include semantics tests verifying labels, focus order, and keyboard affordances.
