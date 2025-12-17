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
        borderRadius: BorderRadius.circular(ui.radius.xl),
        border: Border.all(color: ui.colors.border),
        boxShadow: ui.shadows.sm,
      ),
      child: DefaultTextStyle.merge(
        style: ui.typography.textSm.copyWith(color: ui.colors.cardForeground),
        child: child,
      ),
    );
  }
}

/// A header for [UiCard].
///
/// Typically contains a [UiCardTitle] and optional description.
/// Can also include an [action] widget positioned in the top-right corner.
class UiCardHeader extends StatelessWidget {
  final Widget child;
  final Widget? action;
  final EdgeInsetsGeometry? padding;

  /// Creates a card header.
  const UiCardHeader({
    super.key,
    required this.child,
    this.action,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    if (action == null) {
      return Padding(
        padding: padding ?? EdgeInsets.all(ui.spacing.xl2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [child],
        ),
      );
    }

    return Padding(
      padding: padding ?? EdgeInsets.all(ui.spacing.xl2),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [child],
          ),
          Positioned(top: 0, right: 0, child: action!),
        ],
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
      style: ui.typography.textBase.copyWith(
        fontWeight: FontWeight.w500,
        color: ui.colors.cardForeground,
        height: 1.0, // Tight line height for titles
      ),
      child: child,
    );
  }
}

/// An action widget for [UiCardHeader].
///
/// Positioned in the top-right corner of the card header.
/// Typically contains a button or icon button.
class UiCardAction extends StatelessWidget {
  final Widget child;

  /// Creates a card action.
  const UiCardAction({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
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
            horizontal: ui.spacing.xl2,
          ).copyWith(bottom: ui.spacing.xl2),
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
      padding: padding ?? EdgeInsets.all(ui.spacing.xl2).copyWith(top: 0),
      child: child,
    );
  }
}
