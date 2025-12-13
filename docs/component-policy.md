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

| shadcn token | Ui token | Status | Notes |
| --- | --- | --- | --- |
| `--color-accent` | UiColorTokens.accent | ✅ | Accent background |
| `--color-accent-foreground` | UiColorTokens.accentForeground | ✅ | Text on accent |
| `--color-background` | UiColorTokens.background | ✅ | App background surface |
| `--color-border` | UiColorTokens.border | ✅ | Default border color |
| `--color-card` | UiColorTokens.card | ✅ | Card background |
| `--color-card-foreground` | UiColorTokens.cardForeground | ✅ | Text on card |
| `--color-destructive` | UiColorTokens.destructive | ✅ | Destructive background (mapped to danger) |
| `--color-destructive-foreground` | UiColorTokens.destructiveForeground | ✅ | Text on destructive |
| `--color-foreground` | UiColorTokens.foreground | ✅ | Default text color |
| `--color-input` | UiColorTokens.input | ✅ | Input border color |
| `--color-muted` | UiColorTokens.muted | ✅ | Muted/secondary text and borders |
| `--color-muted-foreground` | UiColorTokens.mutedForeground | ✅ | Muted text |
| `--color-popover` | UiColorTokens.popover | ✅ | Popover background |
| `--color-popover-foreground` | UiColorTokens.popoverForeground | ✅ | Text on popover |
| `--color-primary` | UiColorTokens.primary | ✅ | Primary brand color |
| `--color-primary-foreground` | UiColorTokens.onPrimary | ✅ | Text/icon on primary surfaces |
| `--color-secondary` | UiColorTokens.secondary | ✅ | Secondary background |
| `--color-secondary-foreground` | UiColorTokens.secondaryForeground | ✅ | Text on secondary |
| `--font-sans` | UiFontTokens.sans | ✅ | Default font family |
| `--radius-lg` | UiRadiusTokens.lg | ✅ | Large corners for modals |
| `--radius-md` | UiRadiusTokens.md | ✅ | Default corners for inputs/cards |
| `--radius-sm` | UiRadiusTokens.sm | ✅ | Keeps button corner radius aligned |
| `--ring` | UiColorTokens.ring | ✅ | Focus ring color |
| `--ring-offset` | UiFocusTokens.ringOffsetWidth | ✅ | Add tokens before shipping focus rings |
| `--ring-offset-width` | UiFocusTokens.ringOffsetWidth | ✅ | Focus ring offset width |
| `--shadow-md` | UiShadowTokens.md | ✅ | Default elevation |
| `--shadow-sm` | UiShadowTokens.sm | ✅ | Small elevation |
| `--spacing-1` | UiSpaceTokens.xs | ✅ | Base spacing scale mapping |
| `--spacing-2` | UiSpaceTokens.sm | ✅ | Small spacing |
| `--text-sm` | UiTypeTokens.textSm | ✅ | Small text size |

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

| Component | Flutter widget | Status | Notes |
| --- | --- | --- | --- |
| Accordion | _TODO_ | ☐ | Single/multiple; animations; keyboard |
| Alert | UiAlert | ☐ | Pending implementation |
| Alert-dialog | _TODO_ | ☐ | Modal dialog variant with actions |
| Aspect-ratio | _TODO_ | ☐ | Media containers maintain ratio |
| Avatar | _TODO_ | ☐ | Initials/fallback; sizes; radius |
| Badge | _TODO_ | ☐ | Track design + tokens |
| Breadcrumb | _TODO_ | ☐ | Separators; overflow; accessibility |
| Button | UiButton | ✅ | Parity with primary/secondary/destructive/outline/ghost/link variants and sizes |
| Button-group | _TODO_ | ☐ | Grouped buttons; spacing; selection |
| Calendar | _TODO_ | ☐ | Date grid; range; keyboard |
| Card | UiCard | ✅ | Surface tokens; header/footer slots |
| Carousel | _TODO_ | ☐ | Slides; controls; autoplay |
| Chart | _TODO_ | ☐ | Tokens for colors/lines; accessibility |
| Checkbox | _TODO_ | ☐ | States: checked/indeterminate/disabled; keyboard: Space |
| Collapsible | _TODO_ | ☐ | Show/hide content; animations |
| Combobox | _TODO_ | ☐ | Typeahead; async data; keyboard |
| Command | _TODO_ | ☐ | Command palette; fuzzy search |
| Context-menu | _TODO_ | ☐ | Right-click menu; shortcuts |
| Data-table | _TODO_ | ☐ | Sorting, filtering, selection, pagination |
| Date-picker | _TODO_ | ☐ | Single/range selection; keyboard; locales |
| Dialog | _TODO_ | ☐ | Modal/non-modal; ARIA; focus trap; animations |
| Drawer | _TODO_ | ☐ | Bottom sheet/drawer variant |
| Dropdown-menu | _TODO_ | ☐ | Menu button; nested items |
| File-input | _TODO_ | ☐ | Drag & drop; accept types; previews |
| Form | _TODO_ | ☐ | Form wrapper and field context |
| Hover-card | _TODO_ | ☐ | Hover-triggered info card; delay & placement |
| Image | _TODO_ | ☐ | Responsive images; fallback |
| Input | UiTextField | ✅ | Uses correct tokens (input, ring, destructive, mutedForeground) and typography |
| Input-otp | _TODO_ | ☐ | Multi-field OTP; paste handling |
| Kbd | _TODO_ | ☐ | Keyboard key badge |
| Label | _TODO_ | ☐ | Form control labels |
| Menubar | _TODO_ | ☐ | Top-level menus; keyboard |
| Navigation-menu | _TODO_ | ☐ | Complex nav; indicators |
| Pagination | _TODO_ | ☐ | Prev/next; page sizes |
| Popover | _TODO_ | ☐ | Anchoring; escape to close; focus trap; portals |
| Progress | _TODO_ | ☐ | Determinate/indeterminate; accessible labels |
| Progress-circular | _TODO_ | ☐ | Circular progress variant |
| Radio | _TODO_ | ☐ | Group behavior; focus management; keyboard: Arrow keys |
| Radio-group | _TODO_ | ☐ | Managed group with roving tabindex |
| Resizable | _TODO_ | ☐ | Split panes; drag handles |
| Scroll-area | _TODO_ | ☐ | Custom scrollbars |
| Select | _TODO_ | ☐ | Listbox w/ typeahead; sizes; disabled items; keyboard |
| Separator | _TODO_ | ☐ | Horizontal/vertical lines |
| Sheet | _TODO_ | ☐ | Bottom/side panels; overlay |
| Sidebar | _TODO_ | ☐ | Collapsible navigation |
| Skeleton | _TODO_ | ☐ | Animation tokens; radius variants |
| Slider | _TODO_ | ☐ | Range; keyboard; marks; sizes |
| Sonner | _TODO_ | ☐ | Toast library integration |
| Steps | _TODO_ | ☐ | Wizard steps; progress |
| Switch | _TODO_ | ☐ | Tokens for track/thumb; focus ring; keyboard: Space |
| Table | _TODO_ | ☐ | Sortable; selectable; density; tokens |
| Tabs | _TODO_ | ☐ | Keyboard: Arrow/Home/End; indicator; sizes |
| Textarea | _TODO_ | ☐ | Auto-size; counters; error/helper mapping |
| Toast | _TODO_ | ☐ | Stacking; auto-dismiss; focus management |
| Toggle | _TODO_ | ☐ | Pressed state; icons; sizes |
| Toggle-group | _TODO_ | ☐ | Group of toggle buttons |
| Tooltip | _TODO_ | ☐ | Delay open/close; accessible labels; placement |

<!-- END:component-coverage -->

> Update this table as soon as a component’s public API or behavior changes.

## 8. Testing

- Write widget tests for every interactive state (default, hover, focus, pressed, disabled, error when relevant).
- Add golden tests for new visual states or variants to guard against regressions when tokens evolve.
- For accessibility-critical components (inputs, dialogs), include semantics tests verifying labels, focus order, and keyboard affordances.
