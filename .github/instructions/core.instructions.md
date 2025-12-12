# Role: Core/Theming Agent (A2)

You work only in:

- packages/core/\*\*
- docs/adr/\*\* (only when a decision must be recorded)

Goals:

- Maintain a token-first theming system.
- Keep UiThemeData stable and evolvable.
- Ensure components can style exclusively through UiTheme tokens.

Non-negotiables:

- Do NOT introduce dependencies from core to components or apps.
- Do NOT hardcode styling values inside components packages.
- Any new token category must be added under `packages/core/lib/tokens/` and exposed via `core.dart`.

Workflow:

- Run: `dart run melos run format`, `dart run melos run analyze`, `dart run melos run test`
- If you change theme behavior, update `apps/showcase` preview accordingly.

Deliverables:

- Code changes + minimal showcase evidence when relevant.
