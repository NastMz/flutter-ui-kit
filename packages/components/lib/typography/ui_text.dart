import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Variants for [UiText] that determine the style of the text.
enum UiTextVariant {
  /// Heading 1 - Largest heading
  h1,

  /// Heading 2
  h2,

  /// Heading 3
  h3,

  /// Heading 4
  h4,

  /// Paragraph text (default)
  p,

  /// Blockquote text
  blockquote,

  /// List item text
  list,

  /// Lead text - Larger than paragraph, for introductions
  lead,

  /// Large text
  large,

  /// Small text
  small,

  /// Muted text - Lower contrast
  muted,
}

/// A text widget that enforces the design system's typography.
///
/// Instead of manually setting styles, use [UiText] with a [UiTextVariant].
///
/// Example:
/// ```dart
/// UiText.h1('Page Title')
/// UiText.p('Regular paragraph text.')
/// UiText.muted('Secondary information.')
/// ```
class UiText extends StatelessWidget {
  final String data;
  final UiTextVariant variant;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  /// Creates a text widget with a specific variant.
  const UiText(
    this.data, {
    super.key,
    this.variant = UiTextVariant.p,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  /// Creates an H1 heading.
  const UiText.h1(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h1;

  /// Creates an H2 heading.
  const UiText.h2(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h2;

  /// Creates an H3 heading.
  const UiText.h3(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h3;

  /// Creates an H4 heading.
  const UiText.h4(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.h4;

  /// Creates a paragraph text.
  const UiText.p(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.p;

  /// Creates a blockquote text.
  const UiText.blockquote(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.blockquote;

  /// Creates a list item text.
  const UiText.list(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.list;

  /// Creates a lead text.
  const UiText.lead(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.lead;

  /// Creates a large text.
  const UiText.large(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.large;

  /// Creates a small text.
  const UiText.small(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : variant = UiTextVariant.small;

  /// Creates a muted text.
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
