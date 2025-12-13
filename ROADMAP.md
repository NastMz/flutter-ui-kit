# Roadmap

This roadmap defines **intentional phases**. Skipping phases is discouraged.

---

## Phase 0 — Bootstrap (DONE)

- Monorepo structure
- Melos + Pub workspace
- VS Code workspace
- CI-ready commands
- Internal-only packages

---

## Phase 1 — Foundations (DONE)

Goal: Establish a stable visual language.

Deliverables:

- [x] Design tokens (color, spacing, typography, radius)
- [x] Theme infrastructure
- [x] Light/Dark theme support
- [x] Token preview in showcase

---

## Phase 2 — Core Components (CURRENT)

Goal: Validate the system with high-impact components and reduce friction in component consumption.

Initial components:

- [x] Button
- [x] Input / TextField
- [x] Card / Surface

Layout Basics (ADD):

- [x] Stack primitives v1 (VStack, HStack, WrapStack)
- [x] Inset / Spacing helpers (UiInset, UiGap)
- [x] Typography recipes (UiText)
- [x] Showcase demos refactor (Replace SizedBox/inline styles)

Definition of Done (Layout Basics):

- 80% of core demos without SizedBox for spacing.
- Spacing sizes use tokens.
- UiText covers basic styles without copyWith.

Pending Core Components (from manifest):

- [ ] Badge
- [ ] Avatar
- [ ] Separator
- [ ] Skeleton
- [ ] Label
- [ ] Checkbox
- [ ] Switch
- [ ] Radio Group
- [ ] Textarea

Focus:

- [x] States (hover, pressed, disabled)
- [ ] Accessibility
- [x] Consistent API surface

---

## Phase 3 — Expansion

Goal: Complex interactive components, layout primitives, and reusable patterns.

### Phase 3A — Layout Primitives

- [ ] UiBox (The "CSS container")
- [ ] UiStack / UiPositioned sugar
- [ ] Divider/Separator layout rules
- [ ] Responsive helpers

Definition of Done:

- Any surface can be built without repeated Container/Padding/DefaultTextStyle.
- Controlled layout without CSS-like cascades.
- Escape hatch: accept native Widget in any slot.

### Phase 3B — Layout Patterns

- [ ] Page Scaffolds (UiPage, UiSection)
- [ ] Form patterns (UiFormField / FieldGroup)
- [ ] List patterns (UiList, UiListItem)

Definition of Done:

- Complex demos (Dialog, Sheet, Form) built without excessive "widget glue".
- Patterns documented with showcase examples.

### Phase 3C — Interactive Components

- [ ] Accordion
- [ ] Alert
- [ ] Alert Dialog
- [ ] Aspect Ratio
- [ ] Breadcrumb
- [ ] Calendar
- [ ] Carousel
- [ ] Chart
- [ ] Collapsible
- [ ] Combobox
- [ ] Command
- [ ] Context Menu
- [ ] Data Table
- [ ] Date Picker
- [ ] Dialog
- [ ] Drawer
- [ ] Dropdown Menu
- [ ] Form
- [ ] Hover Card
- [ ] Input OTP
- [ ] Menubar
- [ ] Navigation Menu
- [ ] Pagination
- [ ] Popover
- [ ] Progress
- [ ] Resizable
- [ ] Scroll Area
- [ ] Select
- [ ] Sheet
- [ ] Sidebar
- [ ] Slider
- [ ] Sonner / Toast
- [ ] Steps
- [ ] Table
- [ ] Tabs
- [ ] Toggle
- [ ] Toggle Group
- [ ] Tooltip

---

## Phase 4 — Stabilization

- API freeze
- Documentation hardening
- Versioning strategy
- Optional publication strategy

---

## Phase 5 — Experimental

- Alternative themes
- Opinionated presets
- Platform-specific variants
