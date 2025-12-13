import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../tokens/color_tokens.dart';
import '../tokens/focus_tokens.dart';
import '../tokens/font_tokens.dart';
import '../tokens/radius_tokens.dart';
import '../tokens/shadow_tokens.dart';
import '../tokens/spacing_tokens.dart';
import '../tokens/typography_tokens.dart';

@immutable
class UiThemeData {
  final Brightness brightness;

  final ColorTokens colors;
  final SpacingTokens spacing;
  final RadiusTokens radius;
  final TypographyTokens typography;
  final FocusTokens focus;
  final ShadowTokens shadows;
  final FontTokens fonts;

  const UiThemeData({
    required this.brightness,
    required this.colors,
    required this.spacing,
    required this.radius,
    required this.typography,
    required this.focus,
    required this.shadows,
    required this.fonts,
  });

  factory UiThemeData.light() {
    final colors = ColorTokens.light();
    final fonts = FontTokens.standard();
    return UiThemeData(
      brightness: Brightness.light,
      colors: colors,
      spacing: SpacingTokens.standard(),
      radius: RadiusTokens.standard(),
      typography: TypographyTokens.standard(
        brightness: Brightness.light,
        fonts: fonts,
      ),
      focus: FocusTokens.standard(ringColor: colors.ring),
      shadows: ShadowTokens.light(),
      fonts: fonts,
    );
  }

  factory UiThemeData.dark() {
    final colors = ColorTokens.dark();
    final fonts = FontTokens.standard();
    return UiThemeData(
      brightness: Brightness.dark,
      colors: colors,
      spacing: SpacingTokens.standard(),
      radius: RadiusTokens.standard(),
      typography: TypographyTokens.standard(
        brightness: Brightness.dark,
        fonts: fonts,
      ),
      focus: FocusTokens.standard(ringColor: colors.ring),
      shadows: ShadowTokens.dark(),
      fonts: fonts,
    );
  }

  UiThemeData copyWith({
    Brightness? brightness,
    ColorTokens? colors,
    SpacingTokens? spacing,
    RadiusTokens? radius,
    TypographyTokens? typography,
    FocusTokens? focus,
    ShadowTokens? shadows,
    FontTokens? fonts,
  }) {
    return UiThemeData(
      brightness: brightness ?? this.brightness,
      colors: colors ?? this.colors,
      spacing: spacing ?? this.spacing,
      radius: radius ?? this.radius,
      typography: typography ?? this.typography,
      focus: focus ?? this.focus,
      shadows: shadows ?? this.shadows,
      fonts: fonts ?? this.fonts,
    );
  }

  UiThemeData lerp(UiThemeData other, double t) {
    return UiThemeData(
      brightness: t < 0.5 ? brightness : other.brightness,
      colors: colors.lerp(other.colors, t),
      spacing: t < 0.5 ? spacing : other.spacing,
      radius: t < 0.5 ? radius : other.radius,
      typography: t < 0.5 ? typography : other.typography,
      focus: focus.lerp(other.focus, t),
      shadows: shadows.lerp(other.shadows, t),
      fonts: fonts.lerp(other.fonts, t),
    );
  }
}



