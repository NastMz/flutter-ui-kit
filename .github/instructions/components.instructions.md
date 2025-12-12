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

Workflow:

- Add/maintain a showcase demo for each public component change.
- Run: `dart run melos run format`, `dart run melos run analyze`, `dart run melos run test`
