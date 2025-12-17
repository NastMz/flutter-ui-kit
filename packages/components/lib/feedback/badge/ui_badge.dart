import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Badge variants following shadcn design.
enum UiBadgeVariant {
  /// Default variant (primary brand color).
  default_,

  /// Secondary variant.
  secondary,

  /// Destructive/danger variant.
  destructive,

  /// Outline variant.
  outline,
}

/// A badge widget for displaying labels, counts, and status indicators.
///
/// Example:
/// ```dart
/// UiBadge(
///   label: 'New',
///   variant: UiBadgeVariant.primary,
/// )
/// ```
class UiBadge extends StatelessWidget {
  /// The badge label text.
  final String label;

  /// The badge variant style.
  final UiBadgeVariant variant;

  /// Creates a badge.
  const UiBadge({
    super.key,
    required this.label,
    this.variant = UiBadgeVariant.default_,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    late Color backgroundColor;
    late Color foregroundColor;

    switch (variant) {
      case UiBadgeVariant.default_:
        backgroundColor = ui.colors.primary;
        foregroundColor = ui.colors.onPrimary;
        break;
      case UiBadgeVariant.secondary:
        backgroundColor = ui.colors.secondary;
        foregroundColor = ui.colors.onSecondary;
        break;
      case UiBadgeVariant.destructive:
        backgroundColor = ui.colors.destructive;
        foregroundColor = ui.colors.destructiveForeground;
        break;
      case UiBadgeVariant.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = ui.colors.foreground;
        break;
    }

    // shadcn badge: h-5 (20px), px-2 (8px), py-0.5 (2px), rounded-4xl, text-xs font-medium
    return Container(
      height: 20, // h-5 = 20px
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ), // px-2 py-0.5
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          ui.radius.xl2,
        ), // rounded-4xl (very rounded)
        border: variant == UiBadgeVariant.outline
            ? Border.all(color: ui.colors.input)
            : null,
      ),
      child: Center(
        child: Text(
          label,
          style: ui.typography.textXs.copyWith(
            // text-xs (12px)
            color: foregroundColor,
            fontWeight: FontWeight.w500, // font-medium
            height: 1, // line height tight para centrar verticalmente
          ),
        ),
      ),
    );
  }
}
