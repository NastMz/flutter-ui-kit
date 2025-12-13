import 'package:flutter/foundation.dart';

/// Defines the spacing scale for the design system.
///
/// Used for padding, margins, and gaps.
@immutable
class SpacingTokens {
  /// Extra small spacing (4px).
  final double xs;

  /// Small spacing (8px).
  final double sm;

  /// Medium spacing (12px).
  final double md;

  /// Large spacing (16px).
  final double lg;

  /// Extra large spacing (24px).
  final double xl;

  /// Creates a set of spacing tokens.
  const SpacingTokens({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  /// Creates the standard spacing tokens.
  factory SpacingTokens.standard() {
    return const SpacingTokens(xs: 4, sm: 8, md: 12, lg: 16, xl: 24);
  }
}
