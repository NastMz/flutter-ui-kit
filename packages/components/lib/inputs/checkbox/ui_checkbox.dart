import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A checkbox widget that follows the design system.
///
/// Example:
/// ```dart
/// UiCheckbox(
///   value: isChecked,
///   onChanged: (value) => setState(() => isChecked = value ?? false),
///   label: 'Accept terms',
/// )
/// ```
class UiCheckbox extends StatelessWidget {
  /// Whether the checkbox is checked.
  final bool value;

  /// Callback when the checkbox state changes.
  final ValueChanged<bool>? onChanged;

  /// Label text displayed next to the checkbox.
  final String? label;

  /// Whether the checkbox is disabled.
  final bool enabled;

  /// Creates a checkbox.
  const UiCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return GestureDetector(
      onTap: enabled ? () => onChanged?.call(!value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CheckboxWidget(value: value, enabled: enabled, onChanged: onChanged),
          if (label != null) ...[
            SizedBox(width: ui.spacing.sm),
            Flexible(
              child: Text(
                label!,
                style: ui.typography.textSm.copyWith(
                  color: enabled
                      ? ui.colors.foreground
                      : ui.colors.mutedForeground,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CheckboxWidget extends StatelessWidget {
  final bool value;
  final bool enabled;
  final ValueChanged<bool>? onChanged;

  const _CheckboxWidget({
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final size = 20.0;
    final radius = ui.radius.sm;

    final borderColor = ui.colors.input;
    final checkedBgColor = value ? ui.colors.primary : Colors.transparent;
    final checkedBorderColor = value ? ui.colors.primary : borderColor;

    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: enabled ? checkedBorderColor : ui.colors.mutedForeground,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(radius),
          color: enabled ? checkedBgColor : ui.colors.muted,
        ),
        child: value
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 14,
                  color: ui.colors.onPrimary,
                  weight: 700,
                ),
              )
            : null,
      ),
    );
  }
}
