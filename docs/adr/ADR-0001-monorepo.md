# ADR-0001: Monorepo Architecture

## Status

Accepted

## Context

The project aims to deliver a reusable UI system composed of multiple packages
(tokens, components, showcase). Independent repositories would increase friction
and reduce coherence.

## Decision

Use a **single monorepo** with:

- Multiple Dart/Flutter packages
- Shared tooling via Melos
- Clear dependency rules

## Consequences

Positive:

- Atomic changes across packages
- Easier refactors
- Consistent tooling

Negative:

- Requires stricter discipline
- Explicit workspace management

This decision is foundational and should not be reversed lightly.
