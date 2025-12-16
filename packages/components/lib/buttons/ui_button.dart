import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// Variants for [UiButton] that determine its visual style.
enum UiButtonVariant {
  /// Primary button style (solid background, contrasting text).
  primary,

  /// Secondary button style (muted background, contrasting text).
  secondary,

  /// Destructive button style (red background, white text).
  destructive,

  /// Outline button style (transparent background, bordered).
  outline,

  /// Ghost button style (transparent background, no border).
  ghost,

  /// Link button style (looks like a text link).
  link,
}

/// Sizes for [UiButton].
enum UiButtonSize {
  /// Small button size.
  sm,

  /// Medium button size (default).
  md,

  /// Large button size.
  lg,

  /// Icon button size (square).
  icon,
}

/// A button widget that follows the design system.
///
/// Example:
/// ```dart
/// UiButton(
///   onPressed: () {},
///   variant: UiButtonVariant.primary,
///   child: Text('Click me'),
/// )
/// ```
class UiButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final UiButtonVariant variant;
  final UiButtonSize size;

  /// Creates a button.
  const UiButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.variant = UiButtonVariant.primary,
    this.size = UiButtonSize.md,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    final padding = _padding(ui);
    final radius = ui.radius.md;

    final background = _background(ui);
    final foreground = _foreground(ui);
    final border = _border(ui);
    final overlay = _overlay(ui);
    final textStyle = _textStyle(ui);
    final minimumSize = _minimumSize(ui);

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(padding),
        minimumSize: WidgetStatePropertyAll(minimumSize),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        backgroundColor: background,
        foregroundColor: foreground,
        overlayColor: overlay,
        side: border,
        textStyle: textStyle,
        elevation: _elevation(ui),
      ),
      child: child,
    );
  }

  EdgeInsets _padding(UiThemeData ui) {
    // Link variant should have no extra padding to look like inline text
    if (variant == UiButtonVariant.link) {
      return EdgeInsets.zero;
    }
    // Icon button has zero padding
    if (size == UiButtonSize.icon) {
      return EdgeInsets.zero;
    }
    // Use button-specific size tokens
    final buttonSize = switch (size) {
      UiButtonSize.sm => ui.sizes.buttonSm,
      UiButtonSize.md => ui.sizes.buttonMd,
      UiButtonSize.lg => ui.sizes.buttonLg,
      UiButtonSize.icon => ui.sizes.buttonMd, // unused
    };
    return EdgeInsets.symmetric(
      horizontal: buttonSize.paddingX,
      vertical: buttonSize.paddingY,
    );
  }

  Size _minimumSize(UiThemeData ui) {
    // Link variant should not enforce a minimum height
    if (variant == UiButtonVariant.link) {
      return const Size(0, 0);
    }
    final buttonSize = switch (size) {
      UiButtonSize.sm => ui.sizes.buttonSm,
      UiButtonSize.md => ui.sizes.buttonMd,
      UiButtonSize.lg => ui.sizes.buttonLg,
      UiButtonSize.icon => ui.sizes.buttonMd,
    };
    return size == UiButtonSize.icon
        ? Size(buttonSize.height, buttonSize.height)
        : Size(0, buttonSize.height);
  }

  WidgetStateProperty<TextStyle?> _textStyle(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      final baseStyle = ui.typography.textSm.copyWith(
        fontWeight: FontWeight.w500,
      );

      // shadcn: link shows underline only on hover
      if (variant == UiButtonVariant.link &&
          states.contains(WidgetState.hovered)) {
        return baseStyle.copyWith(decoration: TextDecoration.underline);
      }

      return baseStyle;
    });
  }

  WidgetStateProperty<double?> _elevation(UiThemeData ui) {
    return WidgetStatePropertyAll(0);
  }

  WidgetStateProperty<Color?> _background(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      final disabled = states.contains(WidgetState.disabled);
      final hovered = states.contains(WidgetState.hovered);

      // Link always has transparent background (including disabled)
      if (variant == UiButtonVariant.link) {
        return Colors.transparent;
      }

      if (disabled) {
        return ui.colors.muted.withValues(alpha: 0.5);
      }

      return switch (variant) {
        UiButtonVariant.primary =>
          hovered
              ? ui.colors.primary.withValues(alpha: 0.9)
              : ui.colors.primary,
        UiButtonVariant.secondary =>
          hovered
              ? ui.colors.secondary.withValues(alpha: 0.8)
              : ui.colors.secondary,
        UiButtonVariant.destructive =>
          hovered
              ? ui.colors.destructive.withValues(alpha: 0.9)
              : ui.colors.destructive,
        UiButtonVariant.outline =>
          hovered ? ui.colors.accent : Colors.transparent,
        UiButtonVariant.ghost =>
          hovered ? ui.colors.accent : Colors.transparent,
        UiButtonVariant.link => Colors.transparent,
      };
    });
  }

  WidgetStateProperty<Color?> _foreground(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      final disabled = states.contains(WidgetState.disabled);

      if (disabled) {
        return ui.colors.mutedForeground;
      }

      return switch (variant) {
        UiButtonVariant.primary => ui.colors.onPrimary,
        UiButtonVariant.secondary => ui.colors.onSecondary,
        UiButtonVariant.destructive => ui.colors.destructiveForeground,
        UiButtonVariant.outline => ui.colors.primary, // Usually foreground
        UiButtonVariant.ghost =>
          states.contains(WidgetState.hovered)
              ? ui.colors.accentForeground
              : ui.colors.primary,
        UiButtonVariant.link => ui.colors.primary,
      };
    });
  }

  WidgetStateProperty<BorderSide?> _border(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      if (variant == UiButtonVariant.outline) {
        return BorderSide(color: ui.colors.input, width: 1);
      }
      return null;
    });
  }

  WidgetStateProperty<Color?> _overlay(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      // Ensure link variant has no hover/pressed/focus overlay (matches shadcn)
      if (variant == UiButtonVariant.link) {
        return Colors.transparent;
      }
      // We handle hover in background for most variants to match shadcn exact colors
      // But for ripple effect (pressed), we can keep a subtle overlay
      if (variant != UiButtonVariant.link &&
          states.contains(WidgetState.pressed)) {
        return ui.colors.foreground.withValues(alpha: 0.1);
      }
      return null;
    });
  }
}
