## 0.0.3

### Breaking Changes

- **Size Tokens Refactoring (`SizesTokens`)**
  - Replaced generic `controlXs/Sm/Md/Lg/Xl` with component-specific sizes
  - Replaced generic `padXXs/Sm/Md/Lg/Xl` and `padYXs/Sm/Md/Lg/Xl` with component-specific padding
  - Now uses `ButtonSizes` (height, paddingX, paddingY) for buttons: `buttonSm`, `buttonDefault`, `buttonLg`
  - Now uses `InputSizes` (height, paddingX, paddingY) for inputs: `inputSm`, `inputDefault`, `inputLg`
  - Added `checkboxSize` (16px fixed) for checkbox and radio components
  - Added `switchWidth` (40px) and `switchHeight` (24px) for switch component
  - Convenience getters `buttonMd` and `inputMd` map to `buttonDefault`/`inputDefault`

### Added

- **Spacing Tokens (`SpacingTokens`)**

  - Expanded to 9-level scale matching shadcn: `none` (0), `px` (2), `xs` (4), `sm` (8), `md` (12), `lg` (16), `xl` (20), `xl2` (24), `xl3` (32)

- **Radius Tokens (`RadiusTokens`)**

  - Expanded to 7-level scale matching shadcn: `none` (0), `xs` (2), `sm` (4), `md` (6), `lg` (8), `xl` (12), `xl2` (16)

- **Size Tokens (`SizesTokens`)**
  - Component-specific sizing architecture
  - Button sizes: sm (36px), default (40px), lg (44px)
  - Input sizes: sm (36px), default (40px), lg (44px)
  - Icon sizes: xs (12px), sm (16px), md (20px), lg (24px), xl (28px)
  - Fixed-size components: checkbox (16px), switch (40x24px)

### Changed

- **Token Philosophy**
  - Each component type now has its own appropriate scale
  - "sm" means different things for different components (36px button vs 16px checkbox)
  - Aligns with shadcn's component-specific sizing approach
  - Clear separation: `spacing` for layout gaps, `sizes` for component ergonomics, `radius` for aesthetics

## 0.0.2

### Added

- **Typography Tokens (`TypographyTokens`)**

  - Added `mono` text style for monospaced fonts
  - Factory `standard()` now accepts both `fontSans` and `fontMono` parameters
  - Complete typing hierarchy: textSm, textBase, textLg, textXl, body, title, headline, mono

- **Theme Data (`UiThemeData`)**

  - Added `fontSans` and `fontMono` properties to hold base font styles
  - Factory methods `.light()` and `.dark()` now accept optional `fontSans` and `fontMono` parameters
  - Supports both explicit font configuration and sensible defaults (system fonts)
  - Proper `lerp()` implementation for theme transitions

- **Documentation**
  - Added comprehensive JSDoc-style documentation to all token classes
  - Documented all `UiTheme` methods and their behavior
  - Documented color tokens with semantic meanings
  - Documented spacing, radius, shadow, focus, and font tokens

### Changed

- Removed `FontTokens` class (was providing minimal value)
- Typography generation now directly uses `TextStyle` for fonts instead of string names
- Font configuration is now flexible - users can omit it and get system defaults

## 0.0.1

- Initial setup with design tokens and theme infrastructure
