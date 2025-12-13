import 'dart:ui';
import 'package:flutter/material.dart';

@immutable
class FocusTokens {
  final double ringOffsetWidth;
  final Color ringColor;

  const FocusTokens({required this.ringOffsetWidth, required this.ringColor});

  factory FocusTokens.standard({required Color ringColor}) {
    return FocusTokens(ringOffsetWidth: 2.0, ringColor: ringColor);
  }

  FocusTokens lerp(FocusTokens other, double t) {
    return FocusTokens(
      ringOffsetWidth: lerpDouble(ringOffsetWidth, other.ringOffsetWidth, t)!,
      ringColor: Color.lerp(ringColor, other.ringColor, t)!,
    );
  }
}
