import 'package:core/core.dart';
import 'package:flutter/material.dart';

class UiCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const UiCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return Container(
      padding: padding,
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
}

class UiCardHeader extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const UiCardHeader({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.all(ui.spacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [child],
      ),
    );
  }
}

class UiCardTitle extends StatelessWidget {
  final Widget child;

  const UiCardTitle({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    return DefaultTextStyle.merge(
      style: ui.typography.title.copyWith(
        color: ui.colors.cardForeground,
        height: 1.0, // Tight line height for titles
      ),
      child: child,
    );
  }
}

class UiCardDescription extends StatelessWidget {
  final Widget child;

  const UiCardDescription({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    return DefaultTextStyle.merge(
      style: ui.typography.textSm.copyWith(color: ui.colors.mutedForeground),
      child: child,
    );
  }
}

class UiCardContent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const UiCardContent({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    return Padding(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: ui.spacing.lg,
          ).copyWith(bottom: ui.spacing.lg),
      child: child,
    );
  }
}

class UiCardFooter extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const UiCardFooter({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.all(ui.spacing.lg).copyWith(top: 0),
      child: child,
    );
  }
}
