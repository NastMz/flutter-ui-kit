## 0.0.11

### Changed

- **TextField/Input Padding Correction (`core` v0.0.6 dependency)**
  - Input padding now matches shadcn exactly: `px-3` (12px), `py-1` (4px)
  - Textarea padding corrected to `px-2 py-2` (8px each)
  - **Impact:** Input and Textarea will appear with corrected internal spacing, matching shadcn precisely

## 0.0.10

### Breaking Changes

- **Visual Alignment with shadcn (`core` v0.0.5 dependency)**
  - All components now inherit corrected dimensions from `SizesTokens`
  - **Buttons are now 4px shorter** to match shadcn exactly:
    - Small buttons: 36px → 32px height
    - Default buttons: 40px → 36px height
    - Large buttons: 44px → 40px height
  - **Icon buttons adjusted:**
    - Medium: 40px → 36px (matches shadcn's default icon button)
    - Large: 48px → 40px
  - **Inputs adjusted** to match button heights
  - **Impact:** Components will appear slightly more compact, matching shadcn's visual design pixel-perfectly
  - **Note:** Updated icon button token references in v0.0.9 now resolve to corrected sizes

## 0.0.9

### Breaking Changes

- **Button API (`UiButton`)**

  - Renamed `UiButtonVariant.primary` to `UiButtonVariant.default_` for exact shadcn parity
  - Migration: Replace all `UiButtonVariant.primary` with `UiButtonVariant.default_`
  - Added `UiButtonSize.iconSm` and `UiButtonSize.iconLg` for additional icon button sizes
  - Icon button sizes now use dedicated tokens: iconSm (32x32), icon (40x40), iconLg (48x48)

- **Badge API (`UiBadge`)**
  - Renamed `UiBadgeVariant.primary` to `UiBadgeVariant.default_` for exact shadcn parity
  - Migration: Replace all `UiBadgeVariant.primary` with `UiBadgeVariant.default_`

### Added

- **Card Action Support (`UiCard`)**

  - Added `UiCardAction` widget for top-right header actions
  - `UiCardHeader` now accepts optional `action` parameter
  - Action renders in top-right corner using Stack positioning
  - Matches shadcn's Card component API for header actions

- **Avatar Customization (`UiAvatar`)**
  - Added optional `borderRadius` parameter
  - Supports rounded square avatars (e.g., `borderRadius: ui.radius.lg`)
  - When `borderRadius` is null, avatar is circular (default)

## 0.0.8

### Breaking Changes

- **Token Migration**
  - All components now use component-specific size tokens
  - `UiButton`: uses `ui.sizes.buttonSm/Default/Lg` instead of generic control sizes
  - `UiTextField`/`UiTextarea`: uses `ui.sizes.inputMd` instead of generic padX/padY
  - `UiCheckbox`/`UiRadio`: uses fixed `ui.sizes.checkboxSize` (16px)
  - `UiSwitch`: uses fixed `ui.sizes.switchWidth/Height` (40x24px)

### Added

- **Sidebar Enhancements (`UiSidebar`)**

  - Added `header` parameter for optional sidebar header widget
  - Added `footer` parameter for optional sidebar footer widget
  - Improved section support with visual separators
  - Icon size now uses `ui.sizes.iconSm` token
  - Left indicator uses `ui.sizes.iconMd` for proper proportion

- **List Improvements (`UiList`/`UiListItem`)**
  - Added `useCardSurface` parameter (defaults to `true`)
  - Items render on `ui.colors.card` surface with border for better contrast on muted backgrounds
  - Improves visibility in dark mode

### Changed

- **Component Sizing**

  - `UiCheckbox`: reduced from 36px to 16px (shadcn-accurate)
  - `UiCheckbox`: border radius changed from `sm` (4px) to `xs` (2px)
  - `UiRadio`: reduced from 36px to 16px (shadcn-accurate)
  - `UiSwitch`: dimensions changed to 40x24px (from 36x40px)
  - All button variants now use token-based padding (no hardcoded values)

- **Contrast Improvements**
  - `UiTextField`: renders on `ui.colors.card` with `filled: true` for better visibility
  - `UiTextarea`: renders on `ui.colors.card` with `filled: true` for better visibility
  - `UiSwitch`: thumb uses `ui.colors.background` instead of hardcoded white
  - `UiAvatar` group: border uses `ui.colors.background` instead of hardcoded white

### Fixed

- **Dark Mode Issues**
  - Fixed inputs washing out on muted backgrounds
  - Fixed list items low contrast on muted surfaces
  - Fixed hardcoded white colors in switch and avatar components

## 0.0.7

### Added

- **Phase 3B — Layout Patterns (Complete)**

  - `UiPage`: Full-page layout scaffold

    - Optional AppBar with title
    - Max-width constraint for wide screens
    - Consistent padding using design tokens
    - Background color support

  - `UiSection`: Content section widget

    - Title and optional description
    - Optional background color and border radius
    - Consistent spacing with design tokens

  - `UiFormFieldInput`: Text input form field

    - Controlled pattern support (value + onChanged)
    - Named constructors: `.email()`, `.password()`, `.number()`
    - Input formatters (e.g., digitsOnly for numbers)
    - Validation callbacks: onChanged, onSubmitted, onBlur
    - Built-in label and error display

  - `UiFormFieldTextarea`: Textarea form field

    - Same features as UiFormFieldInput
    - Configurable min/max lines

  - `UiList`: Consistent list widget

    - Automatic divider handling (removed from last item)
    - Optional spacing between items
    - Proper handling of UiListItem children

  - `UiListItem`: Individual list item widget
    - Leading widget (icon, avatar)
    - Title and optional subtitle
    - Trailing widget (chevron, action button)
    - Optional divider
    - Tap handler support
    - Disabled state support

- **Controlled Input Pattern**

  - All inputs now support shadcn-like controlled pattern
  - Supports both value + onChanged (recommended) and controller pattern
  - Input formatters for character restrictions
  - Real-time and blur-time validation

- **Showcase Demos**
  - Added `layout_patterns_page_demo.dart` showcasing UiPage, UiSection, UiList patterns

## 0.0.6

### Added

- **Phase 3A — Layout Primitives (Complete)**

  - `UiSpacer`: Flexible or fixed spacing widget

    - Fixed spacing using UiSpacing tokens
    - Flexible spacing with customizable flex factor
    - Works in both row and column contexts

  - `UiResponsive`: Show widget on specific screen sizes

    - Show above breakpoint
    - Show below breakpoint
    - Optional fallback widget

  - `UiHidden`: Hide widget on specific screen sizes

    - Hide below breakpoint
    - Hide above breakpoint

  - `UiBreakpoints`: Responsive breakpoint constants
    - Small (640px)
    - Medium (1024px)
    - Large (1280px)
    - Extra Large (1536px)

- **Showcase Demos**
  - Added `layout_primitives_demo.dart` showcasing Spacer and Responsive

### Changed

- Phase 3A is now complete with full layout primitive support

## 0.0.5

### Added

- **Phase 3A — Layout Primitives**

  - `UiBox`: Universal container widget with token-based styling
    - Flexible padding (individual sides or all at once)
    - Background colors using theme colors
    - Borders with custom color and width
    - Border radius using radius tokens
    - Box shadows using shadow tokens
    - Width/height constraints
    - Opacity support
    - Alignment options

- **Showcase Demos**
  - Added `ui_box_demo.dart` showcasing all UiBox capabilities

### Changed

- UiBox replaces manual Container + Padding combinations throughout codebase

## 0.0.4

### Added

- **Additional Input Components**

  - `UiLabel`: Form label with required indicator and hint text
  - `UiTextarea`: Multi-line text input with configurable min/max lines

- **Layout Components**

  - `UiSeparator`: Horizontal or vertical divider with token-based styling

- **Showcase Demos**
  - Added `input_additional_demo.dart` showcasing Label, Textarea, and Separator

### Changed

- Textarea maintains same styling consistency as UiTextField
- Separator supports both directions (horizontal/vertical)

## 0.0.3

### Added

- **Input Controls**

  - `UiCheckbox`: Checkbox widget with optional label
  - `UiSwitch`: Toggle switch with animation and optional label
  - `UiRadio<T>`: Generic radio button widget
  - `UiRadioGroup<T>`: Grouped radio buttons with horizontal/vertical layout support

- **Feedback Components**

  - `UiBadge`: Badge widget with multiple variants (primary, secondary, destructive, outline)

- **Surface Components**

  - `UiAvatar`: Profile avatar with image support and text fallback (initials)
  - `UiAvatarGroup`: Overlapping avatar group display
  - `UiAvatarSize` enum: Multiple size options (sm, md, lg, xl)

- **Showcase Demos**
  - Added `input_controls_demo.dart` showcasing Checkbox, Switch, and Radio
  - Added `badge_demo.dart` with all badge variants
  - Added `avatar_demo.dart` with sizes and grouping

### Changed

- All input controls use token-based colors, spacing, and styling
- Avatar group uses white borders for visual separation
- Badge padding and styling aligned with design system

## 0.0.2

### Added

- **Layout Primitives**

  - `VStack`: Vertical column with token-based spacing
  - `HStack`: Horizontal row with token-based spacing
  - `WrapStack`: Wrapping layout with token-based spacing
  - `UiGap`: Token-safe spacing widget (replaces raw SizedBox)
  - `UiInset`: Token-based padding container
  - `UiSpacing` enum: xs, sm, md, lg, xl spacing tokens

- **Typography Utilities**

  - `UiText` widget with semantic constructors: `.h1`, `.h2`, `.h3`, `.h4`, `.p`, `.blockquote`, `.list`, `.lead`, `.large`, `.small`, `.muted`
  - Eliminates need for manual `copyWith()` on theme typography

- **Documentation**
  - Added comprehensive JSDoc-style documentation to all components
  - Documented `UiButton`, `UiButtonVariant`, `UiButtonSize`
  - Documented `UiTextField` with all parameters
  - Documented `UiCard`, `UiCardHeader`, `UiCardTitle`, `UiCardDescription`, `UiCardContent`, `UiCardFooter`
  - Added usage examples to layout primitives

### Changed

- Refactored demo code to use layout primitives (`VStack`, `HStack`, `WrapStack`)
- Replaced manual `SizedBox` spacing with `UiGap` and token-based spacing
- Simplified showcase main layout using `UiInset` and `UiText`
- Updated all demos (`button_demo.dart`, `input_demo.dart`, `card_demo.dart`) to use new layout system

### Fixed

- Removed undefined `WrapClip` type (replaced with standard Flutter `Clip` enum)
- Fixed unused variable warnings in demo components

## 0.0.1

- Initial component library setup with Button, TextField, and Card
