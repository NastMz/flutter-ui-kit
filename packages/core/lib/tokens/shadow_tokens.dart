import 'package:flutter/material.dart';

/// Defines the shadow styles for elevation and depth.
@immutable
class ShadowTokens {
  /// Small shadow for low elevation elements.
  final List<BoxShadow> sm;

  /// Medium shadow for standard elevation elements (cards, dropdowns).
  final List<BoxShadow> md;

  /// Creates a set of shadow tokens.
  const ShadowTokens({required this.sm, required this.md});

  /// Creates the standard light theme shadow tokens.
  factory ShadowTokens.light() {
    return const ShadowTokens(
      sm: [
        BoxShadow(
          color: Color(0x0D000000),
          offset: Offset(0, 1),
          blurRadius: 2,
        ),
      ],
      md: [
        BoxShadow(
          color: Color(0x1A000000),
          offset: Offset(0, 4),
          blurRadius: 6,
          spreadRadius: -1,
        ),
        BoxShadow(
          color: Color(0x1A000000),
          offset: Offset(0, 2),
          blurRadius: 4,
          spreadRadius: -1,
        ),
      ],
    );
  }

  /// Creates the standard dark theme shadow tokens.
  factory ShadowTokens.dark() {
    return const ShadowTokens(
      sm: [
        BoxShadow(
          color: Color(0x80000000),
          offset: Offset(0, 1),
          blurRadius: 2,
        ),
      ],
      md: [
        BoxShadow(
          color: Color(0x80000000),
          offset: Offset(0, 4),
          blurRadius: 6,
          spreadRadius: -1,
        ),
        BoxShadow(
          color: Color(0x80000000),
          offset: Offset(0, 2),
          blurRadius: 4,
          spreadRadius: -1,
        ),
      ],
    );
  }

  /// Linearly interpolate between two shadow tokens.
  ShadowTokens lerp(ShadowTokens other, double t) {
    return ShadowTokens(
      sm: BoxShadow.lerpList(sm, other.sm, t)!,
      md: BoxShadow.lerpList(md, other.md, t)!,
    );
  }
}
