import 'package:flutter/material.dart';

/// Defines the typography styles for the design system.
@immutable
class TypographyTokens {
  /// Small text style (14px).
  final TextStyle textSm;

  /// Base text style (16px).
  final TextStyle textBase;

  /// Large text style (18px).
  final TextStyle textLg;

  /// Extra large text style (20px).
  final TextStyle textXl;

  /// Body text style (alias for textSm).
  final TextStyle body;

  /// Title text style (textBase, bold).
  final TextStyle title;

  /// Headline text style (textXl, bold).
  final TextStyle headline;

  /// Monospace text style (14px).
  final TextStyle mono;

  /// Creates a set of typography tokens.
  const TypographyTokens({
    required this.textSm,
    required this.textBase,
    required this.textLg,
    required this.textXl,
    required this.body,
    required this.title,
    required this.headline,
    required this.mono,
  });

  /// Creates the standard typography tokens based on brightness and font family.
  factory TypographyTokens.standard({
    required Brightness brightness,
    required TextStyle fontSans,
    required TextStyle fontMono,
  }) {
    final baseColor = brightness == Brightness.dark
        ? const Color(0xFFFAFAFA)
        : const Color(0xFF09090B);

    final textSm = fontSans.copyWith(
      fontSize: 14,
      height: 1.42,
      color: baseColor,
    );

    final textBase = fontSans.copyWith(
      fontSize: 16,
      height: 1.5,
      color: baseColor,
    );

    final textLg = fontSans.copyWith(
      fontSize: 18,
      height: 1.55,
      color: baseColor,
    );

    final textXl = fontSans.copyWith(
      fontSize: 20,
      height: 1.4,
      color: baseColor,
    );

    final mono = fontMono.copyWith(
      fontSize: 14,
      height: 1.42,
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
      mono: mono,
    );
  }
}
