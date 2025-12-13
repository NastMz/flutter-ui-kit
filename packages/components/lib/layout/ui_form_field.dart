import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../inputs/label/ui_label.dart';
import '../inputs/ui_text_field.dart';
import '../typography/ui_text.dart';
import 'ui_spacing.dart';
import 'ui_stack.dart';

/// A container that groups multiple form fields with consistent spacing.
///
/// Useful for organizing related fields together (e.g., address fields, personal info).
///
/// Example:
/// ```dart
/// UiFieldGroup(
///   title: 'Contact Information',
///   children: [
///     UiFormFieldInput(label: 'Email', ...),
///     UiFormFieldInput(label: 'Phone', ...),
///   ],
/// )
/// ```
class UiFieldGroup extends StatelessWidget {
  /// Optional title for the group
  final String? title;

  /// The form fields within this group
  final List<Widget> children;

  /// Gap between fields in the group
  final UiSpacing fieldGap;

  /// Creates a field group.
  const UiFieldGroup({
    super.key,
    this.title,
    required this.children,
    this.fieldGap = UiSpacing.lg,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: UiSpacing.md,
      children: [
        // Optional title
        if (title != null)
          UiText.p(
            title!,
            style: ui.typography.textSm.copyWith(
              fontWeight: FontWeight.w600,
              color: ui.colors.foreground,
            ),
          ),

        // Fields container with consistent spacing
        VStack(
          crossAxisAlignment: CrossAxisAlignment.start,
          gap: fieldGap,
          children: children,
        ),
      ],
    );
  }
}

/// A form field wrapper that combines a label, input, error message, and helper text.
///
/// Provides a consistent pattern for form inputs across the design system.
///
/// Example:
/// ```dart
/// UiFormField(
///   label: 'Email',
///   required: true,
///   child: UiTextField(placeholder: 'you@example.com'),
///   helperText: 'We\'ll use this to send updates',
/// )
/// ```
class UiFormField extends StatelessWidget {
  /// The label displayed above the input
  final String label;

  /// Whether the field is required
  final bool required;

  /// The child input widget (typically UiTextField)
  final Widget child;

  /// Error message to display below the input
  final String? errorText;

  /// Helper text displayed below the input (when no error)
  final String? helperText;

  /// Gap between label and input
  final UiSpacing? labelGap;

  /// Whether the field is disabled
  final bool enabled;

  /// Creates a form field.
  const UiFormField({
    super.key,
    required this.label,
    required this.child,
    this.required = false,
    this.errorText,
    this.helperText,
    this.labelGap = UiSpacing.sm,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final hasError = errorText != null && errorText!.isNotEmpty;

    return VStack(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: labelGap,
      children: [
        // Label with required indicator
        UiLabel(text: label, required: required),

        // Input child
        child,

        // Error or helper text
        if (hasError || helperText != null)
          UiText.small(
            hasError ? errorText! : helperText!,
            style: ui.typography.textSm.copyWith(
              color: hasError
                  ? ui.colors.destructiveForeground
                  : ui.colors.mutedForeground,
            ),
          ),
      ],
    );
  }
}

/// Convenience builder for UiFormField with embedded UiTextField.
///
/// Simplifies the common case of label + text input.
class UiFormFieldInput extends StatelessWidget {
  /// The label displayed above the input
  final String label;

  /// Whether the field is required
  final bool required;

  /// The text controller
  final TextEditingController? controller;

  /// Placeholder text
  final String placeholder;

  /// Error message to display
  final String? errorText;

  /// Helper text displayed when no error
  final String? helperText;

  /// Whether the input is enabled
  final bool enabled;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Input type (text, email, password, etc)
  final TextInputType keyboardType;

  /// Gap between label and input
  final UiSpacing? labelGap;

  /// Creates a form field input.
  const UiFormFieldInput({
    super.key,
    required this.label,
    this.required = false,
    this.controller,
    this.placeholder = '',
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.labelGap = UiSpacing.sm,
  });

  @override
  Widget build(BuildContext context) {
    return UiFormField(
      label: label,
      required: required,
      errorText: errorText,
      helperText: helperText,
      labelGap: labelGap,
      enabled: enabled,
      child: UiTextField(
        controller: controller,
        placeholder: placeholder,
        enabled: enabled,
        obscureText: obscureText,
        keyboardType: keyboardType,
        errorText: errorText,
      ),
    );
  }
}
