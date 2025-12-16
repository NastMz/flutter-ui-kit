import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'ui_gap.dart';
import 'ui_spacing.dart';
import 'ui_stack.dart';
import 'ui_inset.dart';
import 'ui_box.dart';

/// A list item widget with optional leading/trailing content and divider support.
///
/// Provides consistent styling and spacing for list items.
///
/// Example:
/// ```dart
/// UiListItem(
///   leading: Icon(Icons.person),
///   title: Text('John Doe'),
///   subtitle: Text('john@example.com'),
///   trailing: Icon(Icons.chevron_right),
/// )
/// ```
class UiListItem extends StatelessWidget {
  /// Leading widget (usually an icon or avatar)
  final Widget? leading;

  /// Main title text
  final Widget title;

  /// Subtitle text (appears below title)
  final Widget? subtitle;

  /// Trailing widget (usually an icon or button)
  final Widget? trailing;

  /// Padding inside the list item
  final UiSpacing padding;

  /// Gap between leading and content
  final UiSpacing? leadingGap;

  /// Gap between title and subtitle
  final UiSpacing? contentGap;

  /// Whether to show a divider below the item
  final bool showDivider;

  /// Custom divider color
  final Color? dividerColor;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  /// Whether the item is enabled
  final bool enabled;

  /// Render item on a card-like surface for better contrast on muted backgrounds.
  final bool useCardSurface;

  /// Creates a list item.
  const UiListItem({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.padding = UiSpacing.md,
    this.leadingGap = UiSpacing.md,
    this.contentGap = UiSpacing.xs,
    this.showDivider = true,
    this.dividerColor,
    this.onTap,
    this.enabled = true,
    this.useCardSurface = false,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final opacity = enabled ? 1.0 : 0.5;
    final divColor = dividerColor ?? ui.colors.mutedForeground;

    // Build the content area (title + subtitle)
    final contentStack = VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: contentGap,
      mainAxisSize: MainAxisSize.min,
      children: [title, if (subtitle != null) subtitle!],
    );

    // Build the main row (leading + content + trailing)
    Widget content = HStack(
      children: [
        if (leading != null) ...[
          Opacity(opacity: opacity, child: leading!),
          if (leadingGap != null) UiGap(leadingGap),
        ],
        Expanded(
          child: Opacity(opacity: opacity, child: contentStack),
        ),
        if (trailing != null) ...[
          if (leadingGap != null) UiGap(leadingGap),
          Opacity(opacity: opacity, child: trailing!),
        ],
      ],
    );

    // Wrap with optional surface and padding
    if (useCardSurface) {
      content = UiBox(
        backgroundColor: ui.colors.card,
        borderColor: ui.colors.border,
        borderWidth: 1,
        borderRadius: ui.radius.md,
        child: UiInset(all: padding, child: content),
      );
    } else {
      content = UiInset(all: padding, child: content);
    }

    // Add tap handler if callback provided
    if (onTap != null) {
      content = GestureDetector(onTap: enabled ? onTap : null, child: content);
    }

    // Add divider if needed
    if (showDivider) {
      return VStack(
        children: [
          content,
          Divider(color: divColor, height: 1),
        ],
      );
    }

    return content;
  }
}

/// A list widget that consistently spaces and divides list items.
///
/// Removes the default divider from the last item.
///
/// Example:
/// ```dart
/// UiList(
///   gap: UiSpacing.md,
///   children: [
///     UiListItem(title: Text('Item 1')),
///     UiListItem(title: Text('Item 2')),
///     UiListItem(title: Text('Item 3')),
///   ],
/// )
/// ```
class UiList extends StatelessWidget {
  /// List items
  final List<Widget> children;

  /// Gap between items (optional)
  final UiSpacing? gap;

  /// Whether all items show dividers (last item is excluded by default)
  final bool showAllDividers;

  /// Creates a list.
  const UiList({
    super.key,
    required this.children,
    this.gap,
    this.showAllDividers = false,
  });

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final items = children.asMap().entries.map((entry) {
      final index = entry.key;
      final child = entry.value;
      final isLast = index == children.length - 1;

      // If child is UiListItem, remove divider from last item
      if (child is UiListItem && isLast && !showAllDividers) {
        return UiListItem(
          leading: child.leading,
          title: child.title,
          subtitle: child.subtitle,
          trailing: child.trailing,
          padding: child.padding,
          leadingGap: child.leadingGap,
          contentGap: child.contentGap,
          showDivider: false,
          dividerColor: child.dividerColor,
          onTap: child.onTap,
          enabled: child.enabled,
          useCardSurface: child.useCardSurface,
        );
      }

      return child;
    }).toList();

    // Add gaps between items if specified
    if (gap == null) {
      return VStack(children: items);
    }

    final itemsWithGaps = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      itemsWithGaps.add(items[i]);
      if (i < items.length - 1) {
        itemsWithGaps.add(UiGap(gap!));
      }
    }

    return VStack(children: itemsWithGaps);
  }
}
