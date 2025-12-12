import 'package:flutter/material.dart';

@immutable
class ColorTokens {
  final Color background;
  final Color foreground;
  final Color primary;
  final Color border;
  final Color danger;
  final Color warning;
  final Color success;

  const ColorTokens({
    required this.background,
    required this.foreground,
    required this.primary,
    required this.border,
    required this.danger,
    required this.warning,
    required this.success,
  });

  factory ColorTokens.light() {
    return const ColorTokens(
      background: Color(0xFFFFFFFF),
      foreground: Color(0xFF111111),
      primary: Color(0xFF2563EB),
      border: Color(0xFFE5E7EB),
      danger: Color(0xFFDC2626),
      warning: Color(0xFFD97706),
      success: Color(0xFF16A34A),
    );
  }

  factory ColorTokens.dark() {
    return const ColorTokens(
      background: Color(0xFF0B0F14),
      foreground: Color(0xFFF3F4F6),
      primary: Color(0xFF60A5FA),
      border: Color(0xFF243041),
      danger: Color(0xFFEF4444),
      warning: Color(0xFFF59E0B),
      success: Color(0xFF22C55E),
    );
  }

  ColorTokens lerp(ColorTokens other, double t) {
    return ColorTokens(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      border: Color.lerp(border, other.border, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}
