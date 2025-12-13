import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum UiSpacing { xs, sm, md, lg, xl }

class UiInset extends StatelessWidget {
  final Widget child;
  final UiSpacing? all;
  final UiSpacing? horizontal;
  final UiSpacing? vertical;
  final UiSpacing? top;
  final UiSpacing? bottom;
  final UiSpacing? left;
  final UiSpacing? right;

  const UiInset({
    super.key,
    required this.child,
    this.all,
    this.horizontal,
    this.vertical,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    return Padding(padding: _getEdgeInsets(ui), child: child);
  }

  EdgeInsets _getEdgeInsets(UiThemeData ui) {
    if (all != null) {
      final value = _getValue(ui, all!);
      return EdgeInsets.all(value);
    }

    double l = 0, t = 0, r = 0, b = 0;

    if (horizontal != null) {
      final value = _getValue(ui, horizontal!);
      l = value;
      r = value;
    }

    if (vertical != null) {
      final value = _getValue(ui, vertical!);
      t = value;
      b = value;
    }

    if (left != null) l = _getValue(ui, left!);
    if (top != null) t = _getValue(ui, top!);
    if (right != null) r = _getValue(ui, right!);
    if (bottom != null) b = _getValue(ui, bottom!);

    return EdgeInsets.fromLTRB(l, t, r, b);
  }

  double _getValue(UiThemeData ui, UiSpacing spacing) {
    return switch (spacing) {
      UiSpacing.xs => ui.spacing.xs,
      UiSpacing.sm => ui.spacing.sm,
      UiSpacing.md => ui.spacing.md,
      UiSpacing.lg => ui.spacing.lg,
      UiSpacing.xl => ui.spacing.xl,
    };
  }
}
