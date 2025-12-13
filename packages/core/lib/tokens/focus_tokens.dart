import 'dart:ui';
import 'package:flutter/material.dart';

/// Defines the focus ring styles for accessibility and keyboard navigation.
@immutable
class FocusTokens {
  /// The width of the offset between the element and the focus ring.
  final double ringOffsetWidth;

  /// The color of the focus ring.
  final Color ringColor;

  /// Creates a set of focus tokens.
  const FocusTokens({required this.ringOffsetWidth, required this.ringColor});

  /// Creates the standard focus tokens.
  factory FocusTokens.standard({required Color ringColor}) {
    return FocusTokens(ringOffsetWidth: 2.0, ringColor: ringColor);
  }

  /// Linearly interpolate between two focus tokens.
  FocusTokens lerp(FocusTokens other, double t) {
    return FocusTokens(
      ringOffsetWidth: lerpDouble(ringOffsetWidth, other.ringOffsetWidth, t)!,
      ringColor: Color.lerp(ringColor, other.ringColor, t)!,
    );
  }
}
