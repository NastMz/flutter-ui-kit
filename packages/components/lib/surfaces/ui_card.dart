import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum UiCardVariant { solid, outlined }

enum UiCardPadding { none, sm, md, lg }

class UiCard extends StatelessWidget {
  final Widget child;
  final UiCardVariant variant;
  final UiCardPadding padding;

  const UiCard({
    super.key,
    required this.child,
    this.variant = UiCardVariant.solid,
    this.padding = UiCardPadding.md,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    final bg = ui.colors.background;
    final border = ui.colors.border;
    final radius = ui.radius.md;

    return Container(
      padding: _padding(ui),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radius),
        border: variant == UiCardVariant.outlined
            ? Border.all(color: border)
            : null,
      ),
      child: DefaultTextStyle.merge(
        style: TextStyle(color: ui.colors.foreground),
        child: child,
      ),
    );
  }

  EdgeInsets _padding(UiThemeData ui) {
    return switch (padding) {
      UiCardPadding.none => EdgeInsets.zero,
      UiCardPadding.sm => EdgeInsets.all(ui.spacing.sm),
      UiCardPadding.md => EdgeInsets.all(ui.spacing.lg),
      UiCardPadding.lg => EdgeInsets.all(ui.spacing.xl),
    };
  }
}
