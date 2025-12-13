import 'package:flutter/material.dart';
import 'ui_spacing.dart';

/// A flexible spacer widget that uses spacing tokens.
///
/// In a row context, expands horizontally.
/// In a column context, expands vertically.
///
/// Example:
/// ```dart
/// HStack(
///   children: [
///     Text('Left'),
///     UiSpacer(),  // Takes remaining space
///     Text('Right'),
///   ],
/// )
/// ```
class UiSpacer extends StatelessWidget {
  /// Fixed space using tokens. If set, ignores flex.
  final UiSpacing? space;

  /// Flex factor for flexible spacing (default 1).
  final int flex;

  /// Creates a spacer.
  const UiSpacer({super.key, this.space, this.flex = 1});

  @override
  Widget build(BuildContext context) {
    if (space != null) {
      final value = _spacingValue(space!);
      return SizedBox(width: value, height: value);
    }

    return Spacer(flex: flex);
  }

  static double _spacingValue(UiSpacing spacing) {
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
}
