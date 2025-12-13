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
