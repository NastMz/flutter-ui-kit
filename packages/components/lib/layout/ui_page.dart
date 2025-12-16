import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'ui_box.dart';
import 'ui_spacing.dart';
import 'ui_stack.dart';
import 'ui_inset.dart';

/// A full-page layout scaffold that handles spacing, max-width, and padding.
///
/// Useful for creating consistently-styled pages without boilerplate.
///
/// When [isStandalone] is true (default), creates a full Scaffold with AppBar.
/// When false, only provides content layout without Scaffold, suitable for
/// embedding in ScrollViews or other parent containers.
///
/// Example (standalone page):
/// ```dart
/// UiPage(
///   title: 'Settings',
///   child: VStack(
///     gap: UiSpacing.lg,
///     children: [
///       UiSection(title: 'Account', child: ...),
///       UiSection(title: 'Privacy', child: ...),
///     ],
///   ),
/// )
/// ```
///
/// Example (embedded in ScrollView):
/// ```dart
/// UiScrollArea(
///   child: UiPage(
///     isStandalone: false,
///     child: MyContent(),
///   ),
/// )
/// ```
class UiPage extends StatelessWidget {
  /// Page title (appears in AppBar if provided and [isStandalone] is true)
  final String? title;

  /// Main page content
  final Widget child;

  /// Padding around the page content
  final UiSpacing padding;

  /// Maximum width of the page content (for wide screens)
  final double? maxWidth;

  /// Background color (defaults to theme background)
  final Color? backgroundColor;

  /// Whether to show an AppBar with the title
  final bool showAppBar;

  /// Whether this page is standalone (creates Scaffold) or embedded in a parent container.
  /// When false, only provides content layout without Scaffold wrapper.
  final bool isStandalone;

  /// Creates a page scaffold.
  const UiPage({
    super.key,
    this.title,
    required this.child,
    this.padding = UiSpacing.lg,
    this.maxWidth = 1200,
    this.backgroundColor,
    this.showAppBar = true,
    this.isStandalone = true,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final bgColor = backgroundColor ?? ui.colors.background;

    // Content with max width constraint
    Widget content = Center(
      child: ConstrainedBox(
        constraints: maxWidth != null
            ? BoxConstraints(maxWidth: maxWidth!)
            : const BoxConstraints(),
        child: UiInset(all: padding, child: child),
      ),
    );

    // If not standalone, return just the content (for embedding in ScrollViews)
    if (!isStandalone) {
      return content;
    }

    // Add AppBar if needed (only for standalone pages)
    if (showAppBar && title != null) {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          title: Text(
            title!,
            style: ui.typography.title.copyWith(color: ui.colors.foreground),
          ),
        ),
        body: content,
      );
    }

    return Scaffold(backgroundColor: bgColor, body: content);
  }
}

/// A section within a page that groups related content.
///
/// Provides a title, optional description, and consistent spacing.
///
/// Example:
/// ```dart
/// UiSection(
///   title: 'Account Settings',
///   description: 'Manage your account details',
///   child: VStack(
///     gap: UiSpacing.md,
///     children: [
///       UiTextField(placeholder: 'Username'),
///       UiTextField(placeholder: 'Email'),
///     ],
///   ),
/// )
/// ```
class UiSection extends StatelessWidget {
  /// Section title
  final String title;

  /// Optional description text
  final String? description;

  /// Section content
  final Widget child;

  /// Spacing around the section
  final UiSpacing padding;

  /// Gap between title, description, and content
  final UiSpacing contentGap;

  /// Background color (defaults to transparent)
  final Color? backgroundColor;

  /// Border radius for the section
  final double? borderRadius;

  /// Creates a section.
  const UiSection({
    super.key,
    required this.title,
    this.description,
    required this.child,
    this.padding = UiSpacing.md,
    this.contentGap = UiSpacing.md,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final bgColor = backgroundColor;
    final radius = borderRadius ?? ui.radius.md;

    // Build header (title + optional description)
    final header = VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: UiSpacing.xs,
      children: [
        Text(
          title,
          style: ui.typography.headline.copyWith(
            fontSize: 20,
            color: ui.colors.foreground,
          ),
        ),
        if (description != null)
          Text(
            description!,
            style: ui.typography.textSm.copyWith(
              color: ui.colors.mutedForeground,
            ),
          ),
      ],
    );

    // Build the full section
    Widget content = VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: contentGap,
      children: [header, child],
    );

    // Wrap with background if specified
    if (bgColor != null) {
      content = UiBox(
        padding: UiSpacing.md,
        backgroundColor: bgColor,
        borderRadius: radius,
        child: content,
      );
    } else {
      content = UiInset(all: padding, child: content);
    }

    return content;
  }
}
