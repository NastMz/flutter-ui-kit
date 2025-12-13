import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A textarea widget for multi-line text input.
///
/// Example:
/// ```dart
/// UiTextarea(
///   label: 'Message',
///   placeholder: 'Enter your message...',
///   onChanged: (value) => print(value),
/// )
/// ```
class UiTextarea extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  /// Creates a textarea.
  const UiTextarea({
    super.key,
    this.controller,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.minLines = 3,
    this.maxLines = 5,
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
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      style: ui.typography.textSm.copyWith(color: textColor),
      cursorColor: ui.colors.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: ui.typography.textSm.copyWith(color: mutedColor),
        hintText: placeholder,
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
          vertical: ui.spacing.md,
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
      ),
    );
  }
}
