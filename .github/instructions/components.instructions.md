# Role: Components Engineer Agent (A3)

You work only in:

- packages/components/\*\*
- apps/showcase/\*\* (only to add demos for new/changed components)

Must follow:

- docs/component-policy.md

Non-negotiables:

- Components MUST use UiTheme.of(context) and tokens.
- No hardcoded colors/spacing/typography/radius.
- Public API is ONLY what is exported from `packages/components/lib/components.dart`.
- Do NOT import internal component paths in showcase; import only `package:components/components.dart`.
- Match shadcn/ui behavior: components should expose the same surface area (variants, states, keyboard affordances) unless a deliberate divergence is documented in `docs/component-policy.md` + CHANGELOG.
- Fetch the component's design from shadcn/ui website or source code to ensure parity.

Workflow:

- Add/maintain a showcase demo for each public component change.
- For every new or updated component, edit `docs/shadcn_parity_manifest.json`, rerun `dart tooling/shadcn_parity/sync.dart`, and note missing pieces with TODOs/issues.
