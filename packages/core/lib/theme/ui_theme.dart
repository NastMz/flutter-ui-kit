import 'package:flutter/material.dart';
import 'ui_theme_data.dart';
import 'ui_theme_extension.dart';

/// Utilities for accessing and applying the design system theme.
abstract final class UiTheme {
  /// Retrieves the [UiThemeData] from the current [BuildContext].
  ///
  /// If the theme extension is not found, it falls back to a default
  /// theme based on the current [Theme.brightness].
  static UiThemeData of(BuildContext context) {
    final ext = Theme.of(context).extension<UiThemeExtension>();
    if (ext == null) {
      // Fail-safe: provide a usable default rather than crashing.
      final brightness = Theme.of(context).brightness;
      return brightness == Brightness.dark
          ? UiThemeData.dark()
          : UiThemeData.light();
    }
    return ext.data;
  }

  /// Applies the [UiThemeData] to a Flutter [ThemeData].
  ///
  /// This injects the [UiThemeExtension] into the theme, making it
  /// accessible via [UiTheme.of].
  static ThemeData applyTo(ThemeData base, UiThemeData data) {
    return base.copyWith(
      brightness: data.brightness,
      scaffoldBackgroundColor: data.colors.background,
      colorScheme: base.colorScheme.copyWith(
        brightness: data.brightness,
        primary: data.colors.primary,
        surface: data.colors.background,
        onSurface: data.colors.foreground,
      ),
      extensions: [...base.extensions.values, UiThemeExtension(data)],
    );
  }
}
