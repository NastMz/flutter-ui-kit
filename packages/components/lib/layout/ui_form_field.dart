import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../inputs/label/ui_label.dart';
import '../inputs/textarea/ui_textarea.dart';
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
/// Supports both controlled (value + onChanged) and uncontrolled (controller) patterns.
///
/// Example (controlled - recommended):
/// ```dart
/// UiFormFieldInput(
///   label: 'Email',
///   value: email,
///   onChanged: (value) => setState(() => email = value),
/// )
/// ```
///
/// Example (uncontrolled):
/// ```dart
/// UiFormFieldInput(
///   label: 'Email',
///   controller: emailController,
/// )
/// ```
class UiFormFieldInput extends StatefulWidget {
  /// The label displayed above the input
  final String label;

  /// Whether the field is required
  final bool required;

  /// The text controller (uncontrolled mode)
  final TextEditingController? controller;

  /// The current value (controlled mode)
  final String? value;

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

  /// Called when text changes (controlled mode)
  final ValueChanged<String>? onChanged;

  /// Called when the user submits (e.g., presses Enter)
  final ValueChanged<String>? onSubmitted;

  /// Called when the field loses focus (blur)
  final ValueChanged<String>? onBlur;

  /// Input formatters (e.g., digits only, max length)
  final List<TextInputFormatter>? inputFormatters;

  /// Gap between label and input
  final UiSpacing? labelGap;

  /// Creates a form field input.
  const UiFormFieldInput({
    super.key,
    required this.label,
    this.required = false,
    this.controller,
    this.value,
    this.placeholder = '',
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSubmitted,
    this.onBlur,
    this.inputFormatters,
    this.labelGap = UiSpacing.sm,
  }) : assert(
         controller == null || value == null,
         'Cannot provide both controller and value',
       );

  /// Email input helper
  // ignore: prefer_const_constructors_in_immutables
  UiFormFieldInput.email({
    Key? key,
    required String label,
    bool required = false,
    TextEditingController? controller,
    String? value,
    String placeholder = '',
    String? errorText,
    String? helperText,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    ValueChanged<String>? onBlur,
    List<TextInputFormatter>? inputFormatters,
    UiSpacing? labelGap = UiSpacing.sm,
  }) : this(
         key: key,
         label: label,
         required: required,
         controller: controller,
         value: value,
         placeholder: placeholder,
         errorText: errorText,
         helperText: helperText,
         enabled: enabled,
         keyboardType: TextInputType.emailAddress,
         onChanged: onChanged,
         onSubmitted: onSubmitted,
         onBlur: onBlur,
         inputFormatters: inputFormatters,
         labelGap: labelGap,
       );

  /// Password input helper
  // ignore: prefer_const_constructors_in_immutables
  UiFormFieldInput.password({
    Key? key,
    required String label,
    bool required = false,
    TextEditingController? controller,
    String? value,
    String placeholder = '••••••••',
    String? errorText,
    String? helperText,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    ValueChanged<String>? onBlur,
    List<TextInputFormatter>? inputFormatters,
    UiSpacing? labelGap = UiSpacing.sm,
  }) : this(
         key: key,
         label: label,
         required: required,
         controller: controller,
         value: value,
         placeholder: placeholder,
         errorText: errorText,
         helperText: helperText,
         enabled: enabled,
         obscureText: true,
         keyboardType: TextInputType.visiblePassword,
         onChanged: onChanged,
         onSubmitted: onSubmitted,
         onBlur: onBlur,
         inputFormatters: inputFormatters,
         labelGap: labelGap,
       );

  /// Number input helper
  UiFormFieldInput.number({
    Key? key,
    required String label,
    bool required = false,
    TextEditingController? controller,
    String? value,
    String placeholder = '',
    String? errorText,
    String? helperText,
    bool enabled = true,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    ValueChanged<String>? onBlur,
    List<TextInputFormatter>? inputFormatters,
    UiSpacing? labelGap = UiSpacing.sm,
  }) : this(
         key: key,
         label: label,
         required: required,
         controller: controller,
         value: value,
         placeholder: placeholder,
         errorText: errorText,
         helperText: helperText,
         enabled: enabled,
         keyboardType: const TextInputType.numberWithOptions(
           signed: false,
           decimal: false,
         ),
         onChanged: onChanged,
         onSubmitted: onSubmitted,
         onBlur: onBlur,
         inputFormatters:
             inputFormatters ?? [FilteringTextInputFormatter.digitsOnly],
         labelGap: labelGap,
       );
  @override
  State<UiFormFieldInput> createState() => _UiFormFieldInputState();
}

class _UiFormFieldInputState extends State<UiFormFieldInput> {
  late TextEditingController _internalController;
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _internalController = TextEditingController(text: widget.value ?? '');
    if (widget.onBlur != null) {
      _focusNode = FocusNode();
      _focusNode!.addListener(_handleFocusChange);
    }
  }

  @override
  void dispose() {
    // Only dispose if using controlled mode (no external controller)
    if (widget.controller == null) {
      _internalController.dispose();
    }
    _focusNode?.removeListener(_handleFocusChange);
    _focusNode?.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode?.hasFocus == false && widget.onBlur != null) {
      widget.onBlur!(_internalController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller ?? _internalController;

    return UiFormField(
      label: widget.label,
      required: widget.required,
      errorText: widget.errorText,
      helperText: widget.helperText,
      labelGap: widget.labelGap,
      enabled: widget.enabled,
      child: UiTextField(
        controller: controller,
        focusNode: _focusNode,
        placeholder: widget.placeholder,
        enabled: widget.enabled,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        errorText: widget.errorText,
      ),
    );
  }
}

/// Convenience builder for UiFormField with embedded UiTextarea.
///
/// Supports both controlled (value + onChanged) and uncontrolled (controller) patterns.
///
/// Example (controlled - recommended):
/// ```dart
/// UiFormFieldTextarea(
///   label: 'Description',
///   value: description,
///   onChanged: (value) => setState(() => description = value),
/// )
/// ```
class UiFormFieldTextarea extends StatefulWidget {
  /// Label for the field
  final String label;

  /// Whether the field is required
  final bool required;

  /// Controller for uncontrolled mode
  final TextEditingController? controller;

  /// Value for controlled mode
  final String? value;

  /// Placeholder text
  final String placeholder;

  /// Error message to display
  final String? errorText;

  /// Helper text to display
  final String? helperText;

  /// Whether the field is enabled
  final bool enabled;

  /// Minimum number of lines
  final int minLines;

  /// Maximum number of lines
  final int maxLines;

  /// Called when value changes
  final ValueChanged<String>? onChanged;

  /// Called when the user submits
  final ValueChanged<String>? onSubmitted;

  /// Called when the field loses focus (blur)
  final ValueChanged<String>? onBlur;

  /// Input formatters (e.g., max length)
  final List<TextInputFormatter>? inputFormatters;

  /// Gap between label and input
  final UiSpacing? labelGap;

  /// Creates a form field textarea.
  const UiFormFieldTextarea({
    super.key,
    required this.label,
    this.required = false,
    this.controller,
    this.value,
    this.placeholder = '',
    this.errorText,
    this.helperText,
    this.enabled = true,
    this.minLines = 3,
    this.maxLines = 5,
    this.onChanged,
    this.onSubmitted,
    this.onBlur,
    this.inputFormatters,
    this.labelGap = UiSpacing.sm,
  }) : assert(
         controller == null || value == null,
         'Cannot provide both controller and value',
       );

  @override
  State<UiFormFieldTextarea> createState() => _UiFormFieldTextareaState();
}

class _UiFormFieldTextareaState extends State<UiFormFieldTextarea> {
  late TextEditingController _internalController;
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _internalController =
        widget.controller ?? TextEditingController(text: widget.value ?? '');

    // Create internal focus node if onBlur is provided
    if (widget.onBlur != null) {
      _focusNode = FocusNode();
      _focusNode!.addListener(_handleFocusChange);
    }
  }

  @override
  void dispose() {
    _focusNode?.removeListener(_handleFocusChange);
    _focusNode?.dispose();
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode?.hasFocus == false && widget.onBlur != null) {
      widget.onBlur!(_internalController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller ?? _internalController;

    return UiFormField(
      label: widget.label,
      required: widget.required,
      errorText: widget.errorText,
      helperText: widget.helperText,
      labelGap: widget.labelGap,
      enabled: widget.enabled,
      child: UiTextarea(
        controller: controller,
        focusNode: _focusNode,
        placeholder: widget.placeholder,
        enabled: widget.enabled,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        errorText: widget.errorText,
      ),
    );
  }
}
