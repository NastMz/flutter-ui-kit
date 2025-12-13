import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A card widget that follows the design system.
///
/// Cards are used to group related content and actions.
///
/// Example:
/// ```dart
/// UiCard(
///   child: Column(
///     children: [
///       UiCardHeader(child: UiCardTitle(child: Text('Title'))),
///       UiCardContent(child: Text('Content')),
///     ],
///   ),
/// )
/// ```
class UiCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  /// Creates a card.
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

/// A header for [UiCard].
///
/// Typically contains a [UiCardTitle] and optional description.
class UiCardHeader extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  /// Creates a card header.
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

/// A title for [UiCard].
///
/// Should be used within [UiCardHeader].
class UiCardTitle extends StatelessWidget {
  final Widget child;

  /// Creates a card title.
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

/// A description for [UiCard].
///
/// Should be used within [UiCardHeader] to provide additional context.
class UiCardDescription extends StatelessWidget {
  final Widget child;

  /// Creates a card description.
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

/// The main content area of [UiCard].
class UiCardContent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  /// Creates a card content area.
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
