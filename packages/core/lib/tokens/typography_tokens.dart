import 'package:flutter/material.dart';

@immutable
class TypographyTokens {
  final TextStyle body;
  final TextStyle title;
  final TextStyle headline;

  const TypographyTokens({
    required this.body,
    required this.title,
    required this.headline,
  });

  factory TypographyTokens.standard({required Brightness brightness}) {
    final baseColor = brightness == Brightness.dark
        ? const Color(0xFFF3F4F6)
        : const Color(0xFF111111);

    return TypographyTokens(
      body: TextStyle(fontSize: 14, height: 1.4, color: baseColor),
      title: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: baseColor,
      ),
      headline: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: baseColor,
      ),
    );
  }
}
