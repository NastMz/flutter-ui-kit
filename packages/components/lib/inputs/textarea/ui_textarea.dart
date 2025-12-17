import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A textarea widget for multi-line text input.
///
/// Supports both controlled (value + onChanged) and uncontrolled (controller) patterns.
///
/// Example (controlled - recommended):
/// ```dart
/// UiTextarea(
///   value: message,
///   onChanged: (value) => setState(() => message = value),
///   placeholder: 'Enter your message...',
/// )
/// ```
///
/// Example (uncontrolled):
/// ```dart
/// UiTextarea(
///   controller: messageController,
///   placeholder: 'Enter your message...',
/// )
/// ```
class UiTextarea extends StatefulWidget {
  /// Controller for uncontrolled mode
  final TextEditingController? controller;

  /// Value for controlled mode
  final String? value;

  final String? label;
  final String? placeholder;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  /// Called when the user submits (e.g., presses Enter with Ctrl/Cmd)
  final ValueChanged<String>? onSubmitted;

  /// Called when the field loses focus (blur)
  final ValueChanged<String>? onBlur;

  /// Input formatters (e.g., max length)
  final List<TextInputFormatter>? inputFormatters;

  /// Focus node for managing focus
  final FocusNode? focusNode;

  /// Creates a textarea.
  const UiTextarea({
    super.key,
    this.controller,
    this.value,
    this.label,
    this.placeholder,
    this.helperText,
    this.errorText,
    this.enabled = true,
    this.minLines = 3,
    this.maxLines = 5,
    this.onChanged,
    this.onSubmitted,
    this.onBlur,
    this.inputFormatters,
    this.focusNode,
  }) : assert(
         controller == null || value == null,
         'Cannot provide both controller and value',
       );

  @override
  State<UiTextarea> createState() => _UiTextareaState();
}

class _UiTextareaState extends State<UiTextarea> {
  late TextEditingController _internalController;
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _internalController =
        widget.controller ?? TextEditingController(text: widget.value ?? '');

    // Create internal focus node if onBlur is provided and no external focusNode
    if (widget.onBlur != null && widget.focusNode == null) {
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

  void _handleChanged(String value) {
    if (widget.value != null) {
      // Controlled mode: update internal controller
      _internalController.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    final radius = ui.radius.md;
    final borderColor = ui.colors.input;
    final ringColor = ui.colors.ring;
    final textColor = ui.colors.cardForeground;
    final mutedColor = ui.colors.mutedForeground;

    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return TextField(
      controller: _internalController,
      enabled: widget.enabled,
      onChanged: _handleChanged,
      onSubmitted: widget.onSubmitted,
      focusNode: widget.focusNode ?? _focusNode,
      inputFormatters: widget.inputFormatters,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      style: ui.typography.textSm.copyWith(color: textColor),
      cursorColor: ui.colors.primary,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: ui.typography.textSm.copyWith(color: mutedColor),
        hintText: widget.placeholder,
        hintStyle: ui.typography.textSm.copyWith(color: mutedColor),
        helperText: widget.helperText,
        helperStyle: ui.typography.textSm.copyWith(color: mutedColor),
        errorText: widget.errorText,
        errorStyle: ui.typography.textSm.copyWith(
          color: ui.colors.destructive,
          fontWeight: FontWeight.w500,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: ui.sizes.textarea.paddingX,
          vertical: ui.sizes.textarea.paddingY,
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
            width: 1, // shadcn keeps 1px border, ring is separate box-shadow
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: ui.colors.destructive, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: ui.colors.destructive,
            width: 1,
          ), // consistent 1px
        ),
        // Ensure contrast on muted backgrounds
        filled: true,
        fillColor: ui.colors.card,
      ),
    );
  }
}
