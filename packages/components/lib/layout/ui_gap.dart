import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'ui_inset.dart';

/// A replacement for [SizedBox] when adding spacing between widgets.
///
/// It consumes space in both directions, making it safe to use in
/// both [Row] and [Column].
class UiGap extends StatelessWidget {
  final UiSpacing? spacing;
  final double? rawSize;

  const UiGap(this.spacing, {super.key}) : rawSize = null;

  const UiGap.manual(this.rawSize, {super.key}) : spacing = null;

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final size = spacing != null ? _getValue(ui, spacing!) : rawSize!;
    return SizedBox(width: size, height: size);
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
