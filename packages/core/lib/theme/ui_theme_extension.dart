import 'package:flutter/material.dart';
import 'ui_theme_data.dart';

@immutable
class UiThemeExtension extends ThemeExtension<UiThemeExtension> {
  final UiThemeData data;

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
