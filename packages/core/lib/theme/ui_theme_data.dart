import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

@immutable
class UiThemeData {
  final Brightness brightness;

  final ColorTokens colors;
  final SpacingTokens spacing;
  final RadiusTokens radius;
  final TypographyTokens typography;

  const UiThemeData({
    required this.brightness,
    required this.colors,
    required this.spacing,
    required this.radius,
    required this.typography,
  });

  factory UiThemeData.light() {
    return UiThemeData(
      brightness: Brightness.light,
      colors: ColorTokens.light(),
      spacing: SpacingTokens.standard(),
      radius: RadiusTokens.standard(),
      typography: TypographyTokens.standard(brightness: Brightness.light),
    );
  }

  factory UiThemeData.dark() {
    return UiThemeData(
      brightness: Brightness.dark,
      colors: ColorTokens.dark(),
      spacing: SpacingTokens.standard(),
      radius: RadiusTokens.standard(),
      typography: TypographyTokens.standard(brightness: Brightness.dark),
    );
  }

  UiThemeData copyWith({
    Brightness? brightness,
    ColorTokens? colors,
    SpacingTokens? spacing,
    RadiusTokens? radius,
    TypographyTokens? typography,
  }) {
    return UiThemeData(
      brightness: brightness ?? this.brightness,
      colors: colors ?? this.colors,
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
      typography: typography ?? this.typography,
    );
  }

  UiThemeData lerp(UiThemeData other, double t) {
    return UiThemeData(
      brightness: t < 0.5 ? brightness : other.brightness,
      colors: colors.lerp(other.colors, t),
      spacing: t < 0.5 ? spacing : other.spacing,
      radius: t < 0.5 ? radius : other.radius,
      typography: t < 0.5 ? typography : other.typography,
    );
  }
}
