import 'package:flutter/foundation.dart';

/// Defines the font families used in the design system.
@immutable
class FontTokens {
  /// The primary sans-serif font family (e.g., Inter).
  final String sans;

  /// The monospaced font family (e.g., JetBrains Mono).
  final String mono;

  /// Creates a set of font tokens.
  const FontTokens({required this.sans, required this.mono});

  /// Creates the standard font tokens.
  factory FontTokens.standard() {
    return const FontTokens(sans: 'Inter', mono: 'JetBrains Mono');
  }

  /// Linearly interpolate between two font tokens (returns this as fonts don't interpolate).
  FontTokens lerp(FontTokens other, double t) {
    return this;
  }
}
