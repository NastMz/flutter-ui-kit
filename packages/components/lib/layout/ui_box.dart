import 'package:flutter/material.dart';
import 'ui_spacing.dart';

/// A flexible container widget that uses design tokens for styling.
/// Think of it as a "CSS box" with token-based properties.
///
/// Example:
/// ```dart
/// UiBox(
///   padding: UiSpacing.md,
///   backgroundColor: ui.colors.card,
///   borderRadius: ui.radius.md,
///   child: Text('Content'),
/// )
/// ```
class UiBox extends StatelessWidget {
  /// The child widget.
  final Widget child;

  /// Padding on all sides using spacing tokens.
  final UiSpacing? padding;

  /// Horizontal padding (overrides padding if set).
  final UiSpacing? paddingHorizontal;

  /// Vertical padding (overrides padding if set).
  final UiSpacing? paddingVertical;

  /// Top padding (overrides all other padding settings).
  final UiSpacing? paddingTop;

  /// Right padding (overrides all other padding settings).
  final UiSpacing? paddingRight;

  /// Bottom padding (overrides all other padding settings).
  final UiSpacing? paddingBottom;

  /// Left padding (overrides all other padding settings).
  final UiSpacing? paddingLeft;

  /// Background color. Defaults to transparent.
  final Color? backgroundColor;

  /// Border color.
  final Color? borderColor;

  /// Border width.
  final double? borderWidth;

  /// Border radius for all corners.
  final double? borderRadius;

  /// Box shadow using shadow tokens.
  final BoxShadow? shadow;

  /// Opacity of the widget (0.0 to 1.0).
  final double? opacity;

  /// Width constraint.
  final double? width;

  /// Height constraint.
  final double? height;

  /// Alignment of the child.
  final AlignmentGeometry? alignment;

  /// Creates a box container.
  const UiBox({
    super.key,
    required this.child,
    this.padding,
    this.paddingHorizontal,
    this.paddingVertical,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.paddingLeft,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.shadow,
    this.opacity,
    this.width,
    this.height,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    // Helper function to convert UiSpacing to double
    double spacingValue(UiSpacing? spacing) {
      if (spacing == null) return 0;
      switch (spacing) {
        case UiSpacing.xs:
          return 4;
        case UiSpacing.sm:
          return 8;
        case UiSpacing.md:
          return 16;
        case UiSpacing.lg:
          return 24;
        case UiSpacing.xl:
          return 32;
      }
    }

    // Calculate effective padding
    final top = spacingValue(paddingTop ?? paddingVertical ?? padding);
    final right = spacingValue(paddingRight ?? paddingHorizontal ?? padding);
    final bottom = spacingValue(paddingBottom ?? paddingVertical ?? padding);
    final left = spacingValue(paddingLeft ?? paddingHorizontal ?? padding);

    Widget result = Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: child,
    );

    // Apply decoration (background, border, shadow)
    if (backgroundColor != null ||
        borderColor != null ||
        borderRadius != null ||
        shadow != null) {
      result = Container(
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth ?? 1.0)
              : null,
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : null,
          boxShadow: shadow != null ? [shadow!] : null,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          child: child,
        ),
      );
    } else if (width != null || height != null || alignment != null) {
      result = Container(
        width: width,
        height: height,
        alignment: alignment,
        child: result,
      );
    }

    // Apply opacity if specified
    if (opacity != null) {
      result = Opacity(opacity: opacity!, child: result);
    }

    return result;
  }
}
