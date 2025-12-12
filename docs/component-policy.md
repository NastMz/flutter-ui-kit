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
- Exceptions:
  - transparent (`Colors.transparent`) is allowed when semantically required
  - white/black should be avoided unless explicitly justified (prefer tokens)

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
