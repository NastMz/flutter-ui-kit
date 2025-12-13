import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum UiCardPadding { none, sm, md, lg }

class UiCard extends StatelessWidget {
  final Widget child;
  final UiCardPadding padding;

  const UiCard({
    super.key,
    required this.child,
    this.padding = UiCardPadding.md,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return Container(
      padding: _padding(ui),
      decoration: BoxDecoration(
        color: ui.colors.card,
        borderRadius: BorderRadius.circular(ui.radius.lg),
        border: Border.all(color: ui.colors.border),
        boxShadow: ui.shadows.sm,
      ),
      child: DefaultTextStyle.merge(
        style: ui.typography.textBase.copyWith(color: ui.colors.cardForeground),
        child: child,
      ),
    );
  }

  EdgeInsets _padding(UiThemeData ui) {
    return switch (padding) {
      UiCardPadding.none => EdgeInsets.zero,
      UiCardPadding.sm => EdgeInsets.all(ui.spacing.md),
      UiCardPadding.md => EdgeInsets.all(ui.spacing.lg),
      UiCardPadding.lg => EdgeInsets.all(ui.spacing.xl),
    };
  }
}
