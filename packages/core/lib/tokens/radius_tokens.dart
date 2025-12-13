import 'package:flutter/foundation.dart';

/// Defines the border radius scale for the design system.
@immutable
class RadiusTokens {
  /// Small radius (8px).
  final double sm;

  /// Medium radius (12px).
  final double md;

  /// Large radius (16px).
  final double lg;

  /// Extra large radius (20px).
  final double xl;

  /// Creates a set of radius tokens.
  const RadiusTokens({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  /// Creates the standard radius tokens.
  factory RadiusTokens.standard() {
    return const RadiusTokens(sm: 8, md: 12, lg: 16, xl: 20);
  }
}
