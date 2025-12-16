import 'package:flutter/foundation.dart';

/// Defines the border radius scale for the design system.
/// Matches shadcn's radius scale.
@immutable
class RadiusTokens {
  /// No radius (0px).
  final double none;

  /// 2px radius.
  final double xs;

  /// Small radius (4px).
  final double sm;

  /// Medium radius (6px).
  final double md;

  /// Large radius (8px).
  final double lg;

  /// Extra large radius (12px).
  final double xl;

  /// 2xl radius (16px).
  final double xl2;

  /// Creates a set of radius tokens.
  const RadiusTokens({
    required this.none,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xl2,
  });

  /// Creates the standard radius tokens matching shadcn.
  factory RadiusTokens.standard() {
    return const RadiusTokens(
      none: 0,
      xs: 2,
      sm: 4,
      md: 6,
      lg: 8,
      xl: 12,
      xl2: 16,
    );
  }
}
