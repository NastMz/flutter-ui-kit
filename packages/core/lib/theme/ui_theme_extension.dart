import 'package:flutter/material.dart';
import 'ui_theme_data.dart';

/// A [ThemeExtension] that allows [UiThemeData] to be used with Flutter's [Theme].
@immutable
class UiThemeExtension extends ThemeExtension<UiThemeExtension> {
  /// The design system theme data.
  final UiThemeData data;

  /// Creates a theme extension.
  const UiThemeExtension(this.data);

  @override
  UiThemeExtension copyWith({UiThemeData? data}) {
    return UiThemeExtension(data ?? this.data);
  }

  @override
  UiThemeExtension lerp(ThemeExtension<UiThemeExtension>? other, double t) {
    if (other is! UiThemeExtension) return this;
    return UiThemeExtension(data.lerp(other.data, t));
  }
}
