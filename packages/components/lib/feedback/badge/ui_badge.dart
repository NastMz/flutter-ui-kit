import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Badge variants following shadcn design.
enum UiBadgeVariant {
  /// Primary brand color variant.
  primary,

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
    this.variant = UiBadgeVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    late Color backgroundColor;
    late Color foregroundColor;

    switch (variant) {
      case UiBadgeVariant.primary:
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: ui.spacing.sm, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ui.radius.sm),
        border: variant == UiBadgeVariant.outline
            ? Border.all(color: ui.colors.input)
            : null,
      ),
      child: Text(
        label,
        style: ui.typography.textSm.copyWith(
          color: foregroundColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
