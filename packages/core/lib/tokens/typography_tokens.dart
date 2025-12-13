import 'package:flutter/material.dart';

import 'font_tokens.dart';

@immutable
class TypographyTokens {
  final TextStyle textSm;
  final TextStyle textBase;
  final TextStyle textLg;
  final TextStyle textXl;

  final TextStyle body;
  final TextStyle title;
  final TextStyle headline;

  const TypographyTokens({
    required this.textSm,
    required this.textBase,
    required this.textLg,
    required this.textXl,
    required this.body,
    required this.title,
    required this.headline,
  });

  factory TypographyTokens.standard({
    required Brightness brightness,
    required FontTokens fonts,
  }) {
    final baseColor = brightness == Brightness.dark
        ? const Color(0xFFFAFAFA)
        : const Color(0xFF09090B);

    final textSm = TextStyle(
      fontFamily: fonts.sans,
      fontSize: 14,
      height: 1.42,
      color: baseColor,
    );

    final textBase = TextStyle(
      fontFamily: fonts.sans,
      fontSize: 16,
      height: 1.5,
      color: baseColor,
    );

    final textLg = TextStyle(
      fontFamily: fonts.sans,
      fontSize: 18,
      height: 1.55,
      color: baseColor,
    );

    final textXl = TextStyle(
      fontFamily: fonts.sans,
      fontSize: 20,
      height: 1.4,
      color: baseColor,
    );

    return TypographyTokens(
      textSm: textSm,
      textBase: textBase,
      textLg: textLg,
      textXl: textXl,
      body: textSm,
      title: textBase.copyWith(fontWeight: FontWeight.w600),
      headline: textXl.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
