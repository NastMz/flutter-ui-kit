import 'package:flutter/material.dart';
import 'ui_gap.dart';
import 'ui_spacing.dart';

/// A vertical stack that automatically adds spacing between children.
///
/// Replaces [Column] when you need consistent spacing between items.
///
/// Example:
/// ```dart
/// VStack(
///   gap: UiSpacing.md,
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///   ],
/// )
/// ```
class VStack extends StatelessWidget {
  final List<Widget> children;
  final UiSpacing? gap;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  /// Creates a vertical stack.
  const VStack({
    super.key,
    required this.children,
    this.gap,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: _withGap(children, gap),
    );
  }
}

/// A horizontal stack that automatically adds spacing between children.
///
/// Replaces [Row] when you need consistent spacing between items.
///
/// Example:
/// ```dart
/// HStack(
///   gap: UiSpacing.sm,
///   children: [
///     Icon(Icons.star),
///     Text('Rating'),
///   ],
/// )
/// ```
class HStack extends StatelessWidget {
  final List<Widget> children;
  final UiSpacing? gap;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  /// Creates a horizontal stack.
  const HStack({
    super.key,
    required this.children,
    this.gap,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: _withGap(children, gap),
    );
  }
}

/// A wrap layout that automatically adds spacing between children.
///
/// Replaces [Wrap] when you need consistent spacing between items.
///
/// Example:
/// ```dart
/// WrapStack(
///   gap: UiSpacing.sm,
///   children: [
///     Chip(label: Text('Tag 1')),
///     Chip(label: Text('Tag 2')),
///   ],
/// )
/// ```
class WrapStack extends StatelessWidget {
  final List<Widget> children;
  final UiSpacing? gap;
  final WrapAlignment alignment;
  final WrapCrossAlignment crossAxisAlignment;

  /// Creates a wrap stack.
  const WrapStack({
    super.key,
    required this.children,
    this.gap,
    this.alignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      crossAxisAlignment: crossAxisAlignment,
      children: _withGap(children, gap),
    );
  }
}

List<Widget> _withGap(List<Widget> children, UiSpacing? gap) {
  if (gap == null) return children;
  if (children.isEmpty) return children;

  final List<Widget> result = [];
  for (int i = 0; i < children.length; i++) {
    result.add(children[i]);
    if (i != children.length - 1) {
      result.add(UiGap(gap));
    }
  }
  return result;
}
