import 'package:flutter/material.dart';

@immutable
class ShadowTokens {
  final List<BoxShadow> sm;
  final List<BoxShadow> md;

  const ShadowTokens({required this.sm, required this.md});

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

  ShadowTokens lerp(ShadowTokens other, double t) {
    return ShadowTokens(
      sm: BoxShadow.lerpList(sm, other.sm, t)!,
      md: BoxShadow.lerpList(md, other.md, t)!,
    );
  }
}
