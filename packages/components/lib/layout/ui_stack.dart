import 'package:flutter/material.dart';

/// A vertical stack of widgets with consistent spacing.
class VStack extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  const VStack({
    super.key,
    this.children = const [],
    this.spacing = 0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: _withSpacing(),
    );
  }

  List<Widget> _withSpacing() {
    if (spacing == 0 || children.isEmpty) return children;

    final List<Widget> items = [];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) items.add(SizedBox(height: spacing));
      items.add(children[i]);
    }
    return items;
  }
}

/// A horizontal stack of widgets with consistent spacing.
class HStack extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  const HStack({
    super.key,
    this.children = const [],
    this.spacing = 0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: _withSpacing(),
    );
  }

  List<Widget> _withSpacing() {
    if (spacing == 0 || children.isEmpty) return children;

    final List<Widget> items = [];
    for (var i = 0; i < children.length; i++) {
      if (i > 0) items.add(SizedBox(width: spacing));
      items.add(children[i]);
    }
    return items;
  }
}

/// A wrapping stack of widgets with consistent spacing.
class WrapStack extends StatelessWidget {
  final List<Widget> children;
  final double gap;
  final double runGap;
  final Axis direction;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;

  const WrapStack({
    super.key,
    this.children = const [],
    this.gap = 0,
    this.runGap = 0,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: direction,
      alignment: alignment,
      spacing: gap,
      runAlignment: runAlignment,
      runSpacing: runGap,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      clipBehavior: clipBehavior,
      children: children,
    );
  }
}
