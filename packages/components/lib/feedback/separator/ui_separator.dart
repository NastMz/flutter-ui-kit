import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Separator direction.
enum UiSeparatorDirection { horizontal, vertical }

/// A visual separator/divider widget.
///
/// Example:
/// ```dart
/// UiSeparator()  // horizontal by default
/// UiSeparator(direction: UiSeparatorDirection.vertical)
/// ```
class UiSeparator extends StatelessWidget {
  /// Direction of the separator.
  final UiSeparatorDirection direction;

  /// Custom color for the separator. Defaults to theme border color.
  final Color? color;

  /// Creates a separator.
  const UiSeparator({
    super.key,
    this.direction = UiSeparatorDirection.horizontal,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final separatorColor = color ?? ui.colors.border;

    if (direction == UiSeparatorDirection.vertical) {
      return Container(width: 1, color: separatorColor);
    }

    return Container(height: 1, color: separatorColor);
  }
}
