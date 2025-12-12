import 'package:flutter/material.dart';

@immutable
class UiThemeData {
  final Brightness brightness;

  // Minimal surface tokens for now (we'll replace/expand with real token sets later).
  final Color background;
  final Color foreground;
  final Color primary;
  final Color border;

  const UiThemeData({
    required this.brightness,
    required this.background,
    required this.foreground,
    required this.primary,
    required this.border,
  });

  factory UiThemeData.light() {
    return const UiThemeData(
      brightness: Brightness.light,
      background: Color(0xFFFFFFFF),
      foreground: Color(0xFF111111),
      primary: Color(0xFF2563EB), // temporary default
      border: Color(0xFFE5E7EB),
    );
  }

  factory UiThemeData.dark() {
    return const UiThemeData(
      brightness: Brightness.dark,
      background: Color(0xFF0B0F14),
      foreground: Color(0xFFF3F4F6),
      primary: Color(0xFF60A5FA), // temporary default
      border: Color(0xFF243041),
    );
  }

  UiThemeData copyWith({
    Brightness? brightness,
    Color? background,
    Color? foreground,
    Color? primary,
    Color? border,
  }) {
    return UiThemeData(
      brightness: brightness ?? this.brightness,
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      primary: primary ?? this.primary,
      border: border ?? this.border,
    );
  }

  UiThemeData lerp(UiThemeData other, double t) {
    return UiThemeData(
      brightness: t < 0.5 ? brightness : other.brightness,
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
