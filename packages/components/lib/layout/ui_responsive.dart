import 'package:flutter/material.dart';

/// Responsive breakpoint sizes (in logical pixels).
class UiBreakpoints {
  static const double sm = 640; // Small
  static const double md = 1024; // Medium
  static const double lg = 1280; // Large
  static const double xl = 1536; // Extra large
}

/// Show widget on specific screen sizes.
///
/// Example:
/// ```dart
/// UiResponsive(
///   child: MyWidget(),
///   showAbove: UiBreakpoints.md,  // Only show on medium and larger
/// )
/// ```
class UiResponsive extends StatelessWidget {
  /// Widget to display conditionally.
  final Widget child;

  /// Show widget if screen width is above this value.
  final double? showAbove;

  /// Show widget if screen width is below this value.
  final double? showBelow;

  /// Widget to show when hidden (e.g., placeholder).
  final Widget? fallback;

  /// Creates a responsive widget.
  const UiResponsive({
    super.key,
    required this.child,
    this.showAbove,
    this.showBelow,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool shouldShow = true;
    if (showAbove != null && width < showAbove!) {
      shouldShow = false;
    }
    if (showBelow != null && width >= showBelow!) {
      shouldShow = false;
    }

    return shouldShow ? child : (fallback ?? const SizedBox.shrink());
  }
}

/// Hide widget on specific screen sizes.
///
/// Example:
/// ```dart
/// UiHidden(
///   child: MyWidget(),
///   hideBelow: UiBreakpoints.sm,  // Hide on small screens
/// )
/// ```
class UiHidden extends StatelessWidget {
  /// Widget to display conditionally.
  final Widget child;

  /// Hide widget if screen width is below this value.
  final double? hideBelow;

  /// Hide widget if screen width is above this value.
  final double? hideAbove;

  /// Creates a hidden widget.
  const UiHidden({
    super.key,
    required this.child,
    this.hideBelow,
    this.hideAbove,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool shouldShow = true;
    if (hideBelow != null && width < hideBelow!) {
      shouldShow = false;
    }
    if (hideAbove != null && width >= hideAbove!) {
      shouldShow = false;
    }

    return shouldShow ? child : const SizedBox.shrink();
  }
}
