import 'package:flutter/foundation.dart';

@immutable
class RadiusTokens {
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const RadiusTokens({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  factory RadiusTokens.standard() {
    return const RadiusTokens(sm: 8, md: 12, lg: 16, xl: 20);
  }
}
