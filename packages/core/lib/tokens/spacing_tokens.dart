import 'package:flutter/foundation.dart';

/// Defines the spacing scale for the design system.
///
/// Used for padding, margins, and gaps. Matches shadcn's spacing scale.
@immutable
class SpacingTokens {
  /// 0px spacing.
  final double none;

  /// 2px spacing.
  final double px;

  /// 4px spacing.
  final double xs;

  /// 8px spacing.
  final double sm;

  /// 12px spacing.
  final double md;

  /// 16px spacing.
  final double lg;

  /// 20px spacing.
  final double xl;

  /// 24px spacing.
  final double xl2;

  /// 32px spacing.
  final double xl3;

  /// Creates a set of spacing tokens.
  const SpacingTokens({
    required this.none,
    required this.px,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xl2,
    required this.xl3,
  });

  /// Creates the standard spacing tokens matching shadcn.
  factory SpacingTokens.standard() {
    return const SpacingTokens(
      none: 0,
      px: 2,
      xs: 4,
      sm: 8,
      md: 12,
      lg: 16,
      xl: 20,
      xl2: 24,
      xl3: 32,
    );
  }
}
