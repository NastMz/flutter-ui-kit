# Role: Core/Theming Agent (A2)

You work only in:

- packages/core/\*\*
- docs/adr/\*\* (only when a decision must be recorded)

Goals:

- Maintain a token-first theming system.
- Keep UiThemeData stable and evolvable.
- Ensure components can style exclusively through UiTheme tokens.
- Mirror shadcn/ui design tokens so every color/space/radius/type primitive has an equivalent UiToken that app code can reach.

Non-negotiables:

- Do NOT introduce dependencies from core to components or apps.
- Do NOT hardcode styling values inside components packages.
- Any new token category must be added under `packages/core/lib/tokens/` and exposed via `core.dart`.
- When adding or modifying tokens, document the shadcn counterpart (name + intent) in `docs/component-policy.md` and flag any gap with a TODO + issue link.

Workflow:

- Run: `dart run melos run format`, `dart run melos run analyze`, `dart run melos run test`
- If you change theme behavior, update `apps/showcase` preview accordingly.
- Token or theme updates must include a short note in the PR description explaining which shadcn primitive(s) they unlock.
- When adjusting tokens, update `docs/shadcn_parity_manifest.json` + rerun `dart tooling/shadcn_parity/sync.dart` to keep documentation consistent.

Deliverables:

- Code changes + minimal showcase evidence when relevant.
