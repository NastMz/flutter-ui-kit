import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum UiButtonVariant { primary, secondary, destructive, outline, ghost, link }

enum UiButtonSize { sm, md, lg, icon }

class UiButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final UiButtonVariant variant;
  final UiButtonSize size;

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
    return switch (size) {
      UiButtonSize.sm => EdgeInsets.symmetric(horizontal: ui.spacing.md),
      UiButtonSize.md => EdgeInsets.symmetric(horizontal: ui.spacing.lg),
      UiButtonSize.lg => EdgeInsets.symmetric(
        horizontal: ui.spacing.xl * 1.33,
      ), // approx 32
      UiButtonSize.icon => EdgeInsets.zero,
    };
  }

  Size _minimumSize(UiThemeData ui) {
    return switch (size) {
      UiButtonSize.sm => const Size(0, 36),
      UiButtonSize.md => const Size(0, 40),
      UiButtonSize.lg => const Size(0, 44),
      UiButtonSize.icon => const Size(40, 40),
    };
  }

  WidgetStateProperty<TextStyle?> _textStyle(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      final baseStyle = ui.typography.textSm.copyWith(
        fontWeight: FontWeight.w500,
      );

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
      // We handle hover in background for most variants to match shadcn exact colors
      // But for ripple effect (pressed), we can keep a subtle overlay
      if (states.contains(WidgetState.pressed)) {
        return ui.colors.foreground.withValues(alpha: 0.1);
      }
      return null;
    });
  }
}
