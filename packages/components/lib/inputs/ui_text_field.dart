import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A text field widget that follows the design system.
///
/// Example:
/// ```dart
/// UiTextField(
///   label: 'Username',
///   placeholder: 'Enter your username',
///   onChanged: (value) => print(value),
/// )
/// ```
class UiTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  /// Creates a text field.
  const UiTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    final radius = ui.radius.md;
    final borderColor = ui.colors.input;
    final ringColor = ui.colors.ring;
    final textColor = ui.colors.foreground;
    final mutedColor = ui.colors.mutedForeground;

    final hasError = errorText != null && errorText!.isNotEmpty;

    return TextField(
      controller: controller,
      enabled: enabled,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: ui.typography.textSm.copyWith(color: textColor),
      cursorColor: ui.colors.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: ui.typography.textSm.copyWith(color: mutedColor),
        hintText: placeholder ?? hintText,
        hintStyle: ui.typography.textSm.copyWith(color: mutedColor),
        helperText: helperText,
        helperStyle: ui.typography.textSm.copyWith(color: mutedColor),
        errorText: errorText,
        errorStyle: ui.typography.textSm.copyWith(
          color: ui.colors.destructive,
          fontWeight: FontWeight.w500,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: ui.spacing.md,
          vertical: ui.spacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: hasError ? ui.colors.destructive : borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: hasError ? ui.colors.destructive : ringColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ui.colors.destructive, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ui.colors.destructive, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ui.colors.muted.withValues(alpha: 0.5)),
        ),
        filled: !enabled,
        fillColor: enabled ? null : ui.colors.muted.withValues(alpha: 0.5),
      ),
    );
  }
}
