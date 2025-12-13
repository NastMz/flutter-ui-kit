import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum UiTextVariant {
  h1,
  h2,
  h3,
  h4,
  p,
  blockquote,
  list,
  lead,
  large,
  small,
  muted,
}

class UiText extends StatelessWidget {
  final String data;
  final UiTextVariant variant;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const UiText(
    this.data, {
    super.key,
    this.variant = UiTextVariant.p,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  const UiText.h1(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h1;

  const UiText.h2(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h2;

  const UiText.h3(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h3;

  const UiText.h4(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h4;

  const UiText.p(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.p;

  const UiText.blockquote(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.blockquote;

  const UiText.list(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.list;

  const UiText.lead(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.lead;

  const UiText.large(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.large;

  const UiText.small(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.small;

  const UiText.muted(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.muted;

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final baseStyle = _getStyle(ui);

    return Text(
      data,
      style: baseStyle.merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  TextStyle _getStyle(UiThemeData ui) {
    switch (variant) {
      case UiTextVariant.h1:
        return ui.typography.headline.copyWith(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.2,
        );
      case UiTextVariant.h2:
        return ui.typography.headline.copyWith(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        );
      case UiTextVariant.h3:
        return ui.typography.headline.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        );
      case UiTextVariant.h4:
        return ui.typography.headline.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        );
      case UiTextVariant.p:
        return ui.typography.textBase.copyWith(
          height: 1.7, // Leading-7 equivalent
        );
      case UiTextVariant.blockquote:
        return ui.typography.textBase.copyWith(
          fontStyle: FontStyle.italic,
          color: ui.colors.mutedForeground,
        );
      case UiTextVariant.list:
        return ui.typography.textBase.copyWith(height: 1.7);
      case UiTextVariant.lead:
        return ui.typography.textLg.copyWith(color: ui.colors.mutedForeground);
      case UiTextVariant.large:
        return ui.typography.textLg.copyWith(fontWeight: FontWeight.w600);
      case UiTextVariant.small:
        return ui.typography.textSm.copyWith(
          fontWeight: FontWeight.w500,
          height: 1.4,
        );
      case UiTextVariant.muted:
        return ui.typography.textSm.copyWith(color: ui.colors.mutedForeground);
    }
  }
}
