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

  /// Medium radius (10px). This is shadcn's default --radius (0.625rem).
  final double md;

  /// Large radius (12px).
  final double lg;

  /// Extra large radius (16px).
  final double xl;

  /// 2xl radius (20px).
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
  /// Note: shadcn's default --radius is 0.625rem (10px), which maps to our `md` token.
  factory RadiusTokens.standard() {
    return const RadiusTokens(
      none: 0,
      xs: 2,
      sm: 4,
      md: 10, // Changed from 6 to 10 to match shadcn --radius: 0.625rem
      lg: 12, // Adjusted from 8 to 12
      xl: 16, // Adjusted from 12 to 16
      xl2: 20, // Adjusted from 16 to 20
    );
  }
}
