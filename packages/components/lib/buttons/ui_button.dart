import 'package:core/core.dart';
import 'package:flutter/material.dart';

enum UiButtonVariant { solid, outline }

enum UiButtonSize { sm, md, lg }

class UiButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final UiButtonVariant variant;
  final UiButtonSize size;

  const UiButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.variant = UiButtonVariant.solid,
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

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(padding),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        backgroundColor: background,
        foregroundColor: foreground,
        overlayColor: _overlay(ui),
        side: border,
        textStyle: WidgetStatePropertyAll(ui.typography.title),
      ),
      child: child,
    );
  }

  EdgeInsets _padding(UiThemeData ui) {
    return switch (size) {
      UiButtonSize.sm => EdgeInsets.symmetric(
        horizontal: ui.spacing.md,
        vertical: ui.spacing.sm,
      ),
      UiButtonSize.md => EdgeInsets.symmetric(
        horizontal: ui.spacing.lg,
        vertical: ui.spacing.md,
      ),
      UiButtonSize.lg => EdgeInsets.symmetric(
        horizontal: ui.spacing.xl,
        vertical: ui.spacing.lg,
      ),
    };
  }

  WidgetStateProperty<Color?> _background(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      final disabled = states.contains(WidgetState.disabled);
      final pressed = states.contains(WidgetState.pressed);
      final hovered = states.contains(WidgetState.hovered);

      if (variant == UiButtonVariant.outline) {
        return Colors.transparent;
      }

      if (disabled) return ui.colors.border;
      if (pressed) return ui.colors.primary.withValues(alpha: 0.85);
      if (hovered) return ui.colors.primary.withValues(alpha: 0.92);
      return ui.colors.primary;
    });
  }

  WidgetStateProperty<Color?> _foreground(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      final disabled = states.contains(WidgetState.disabled);

      if (variant == UiButtonVariant.outline) {
        return disabled ? ui.colors.border : ui.colors.primary;
      }

      return disabled
          ? ui.colors.foreground.withValues(alpha: 0.5)
          : Colors.white;
    });
  }

  WidgetStateProperty<BorderSide?> _border(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      final disabled = states.contains(WidgetState.disabled);

      if (variant == UiButtonVariant.solid) return null;

      return BorderSide(
        color: disabled ? ui.colors.border : ui.colors.primary,
        width: 1,
      );
    });
  }

  WidgetStateProperty<Color?> _overlay(UiThemeData ui) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.pressed)) {
        return ui.colors.foreground.withValues(alpha: 0.08);
      }
      if (states.contains(WidgetState.hovered)) {
        return ui.colors.foreground.withValues(alpha: 0.04);
      }
      return null;
    });
  }
}
