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

## Phase 2 — Core Components (DONE)

Goal: Validate the system with high-impact components and reduce friction in component consumption.

Initial components:

- [x] Button
- [x] Input / TextField
- [x] Card / Surface

Layout Basics:

- [x] Stack primitives v1 (VStack, HStack, WrapStack)
- [x] Inset / Spacing helpers (UiInset, UiGap)
- [x] Typography recipes (UiText)
- [x] Showcase demos refactor (Replace SizedBox/inline styles)

Core Components:

- [x] Badge
- [x] Avatar
- [x] Checkbox
- [x] Switch
- [x] Radio Group

Remaining (defer to Phase 3):

- [ ] Separator
- [ ] Skeleton
- [ ] Label
- [ ] Textarea

Completed:

- [x] States (hover, pressed, disabled)
- [x] Consistent API surface
- [x] Comprehensive showcase demos

---

## Phase 3 — Expansion (IN PROGRESS)

Goal: Complex interactive components, layout primitives, and reusable patterns.

### Phase 3A — Layout Primitives (DONE)

- [x] UiBox (The "CSS container")
- [x] UiStack / UiPositioned sugar
- [x] Divider/Separator layout rules
- [x] Responsive helpers (UiResponsive, UiHidden, UiBreakpoints)
- [x] UiSpacer (flexible and fixed spacing)

Definition of Done:

- Any surface can be built without repeated Container/Padding/DefaultTextStyle. ✅
- Controlled layout without CSS-like cascades. ✅
- Escape hatch: accept native Widget in any slot. ✅

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
