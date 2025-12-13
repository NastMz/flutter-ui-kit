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
