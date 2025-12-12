# ADR-0002: Design Tokens Strategy

## Status

Accepted

## Context

UI consistency requires a single source of truth for visual decisions.
Flutter offers multiple theming mechanisms but no enforced token model.

## Decision

Introduce **explicit design tokens** in `packages/core`:

- Colors
- Spacing
- Typography
- Border radius
- (Future) Motion, elevation

Tokens:

- Are plain Dart values or small value objects
- Do not depend on BuildContext
- Are grouped by domain

Theming:

- Implemented using `ThemeExtension`
- Exposed via a convenience accessor (e.g. `UiTheme.of(context)`)

## Consequences

Positive:

- Clear separation of concerns
- Easy customization
- Predictable component styling

Negative:

- Slightly more boilerplate
- Requires discipline when adding components
