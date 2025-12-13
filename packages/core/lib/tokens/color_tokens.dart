import 'package:flutter/material.dart';

/// Defines the color palette for the design system.
///
/// These tokens are semantic, meaning they describe *how* a color is used
/// (e.g., `primary`, `destructive`) rather than *what* the color is (e.g., `red`, `blue`).
@immutable
class ColorTokens {
  /// The background color of the app.
  final Color background;

  /// The foreground color (usually text) on top of the background.
  final Color foreground;

  /// The background color for cards.
  final Color card;

  /// The foreground color for content inside cards.
  final Color cardForeground;

  /// The background color for popovers (dialogs, tooltips).
  final Color popover;

  /// The foreground color for content inside popovers.
  final Color popoverForeground;

  /// The primary brand color.
  final Color primary;

  /// The foreground color for content on top of the primary color.
  final Color onPrimary;

  /// The secondary brand color.
  final Color secondary;

  /// The foreground color for content on top of the secondary color.
  final Color onSecondary;

  /// A muted color for less important content.
  final Color muted;

  /// The foreground color for muted content.
  final Color mutedForeground;

  /// An accent color for highlighting interactive elements.
  final Color accent;

  /// The foreground color for content on top of the accent color.
  final Color accentForeground;

  /// A color indicating destructive actions (e.g., delete).
  final Color destructive;

  /// The foreground color for content on top of the destructive color.
  final Color destructiveForeground;

  /// The color for borders.
  final Color border;

  /// The color for input fields.
  final Color input;

  /// The color for focus rings.
  final Color ring;

  /// A semantic color for danger/error states.
  final Color danger;

  /// A semantic color for warning states.
  final Color warning;

  /// A semantic color for success states.
  final Color success;

  /// Creates a set of color tokens.
  const ColorTokens({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.danger,
    required this.warning,
    required this.success,
  });

  /// Creates the standard light theme color tokens.
  factory ColorTokens.light() {
    return const ColorTokens(
      background: Color(0xFFFFFFFF),
      foreground: Color(0xFF09090B),
      card: Color(0xFFFFFFFF),
      cardForeground: Color(0xFF09090B),
      popover: Color(0xFFFFFFFF),
      popoverForeground: Color(0xFF09090B),
      primary: Color(0xFF18181B),
      onPrimary: Color(0xFFFAFAFA),
      secondary: Color(0xFFF4F4F5),
      onSecondary: Color(0xFF18181B),
      muted: Color(0xFFF4F4F5),
      mutedForeground: Color(0xFF71717A),
      accent: Color(0xFFF4F4F5),
      accentForeground: Color(0xFF18181B),
      destructive: Color(0xFFEF4444),
      destructiveForeground: Color(0xFFFAFAFA),
      border: Color(0xFFE4E4E7),
      input: Color(0xFFE4E4E7),
      ring: Color(0xFF18181B),
      danger: Color(0xFFDC2626),
      warning: Color(0xFFD97706),
      success: Color(0xFF16A34A),
    );
  }

  /// Creates the standard dark theme color tokens.
  factory ColorTokens.dark() {
    return const ColorTokens(
      background: Color(0xFF09090B),
      foreground: Color(0xFFFAFAFA),
      card: Color(0xFF09090B),
      cardForeground: Color(0xFFFAFAFA),
      popover: Color(0xFF09090B),
      popoverForeground: Color(0xFFFAFAFA),
      primary: Color(0xFFFAFAFA),
      onPrimary: Color(0xFF18181B),
      secondary: Color(0xFF27272A),
      onSecondary: Color(0xFFFAFAFA),
      muted: Color(0xFF27272A),
      mutedForeground: Color(0xFFA1A1AA),
      accent: Color(0xFF27272A),
      accentForeground: Color(0xFFFAFAFA),
      destructive: Color(0xFF7F1D1D),
      destructiveForeground: Color(0xFFFAFAFA),
      border: Color(0xFF27272A),
      input: Color(0xFF27272A),
      ring: Color(0xFFD4D4D8),
      danger: Color(0xFFEF4444),
      warning: Color(0xFFF59E0B),
      success: Color(0xFF22C55E),
    );
  }

  ColorTokens lerp(ColorTokens other, double t) {
    return ColorTokens(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      card: Color.lerp(card, other.card, t)!,
      cardForeground: Color.lerp(cardForeground, other.cardForeground, t)!,
      popover: Color.lerp(popover, other.popover, t)!,
      popoverForeground: Color.lerp(
        popoverForeground,
        other.popoverForeground,
        t,
      )!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      mutedForeground: Color.lerp(mutedForeground, other.mutedForeground, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentForeground: Color.lerp(
        accentForeground,
        other.accentForeground,
        t,
      )!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      destructiveForeground: Color.lerp(
        destructiveForeground,
        other.destructiveForeground,
        t,
      )!,
      border: Color.lerp(border, other.border, t)!,
      input: Color.lerp(input, other.input, t)!,
      ring: Color.lerp(ring, other.ring, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}
