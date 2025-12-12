import 'package:flutter/foundation.dart';

@immutable
class SpacingTokens {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const SpacingTokens({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  factory SpacingTokens.standard() {
    return const SpacingTokens(xs: 4, sm: 8, md: 12, lg: 16, xl: 24);
  }
}
