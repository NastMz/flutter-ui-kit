import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A radio button widget that follows the design system.
///
/// Example:
/// ```dart
/// UiRadio(
///   value: 'option1',
///   groupValue: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value),
///   label: 'Option 1',
/// )
/// ```
class UiRadio<T> extends StatelessWidget {
  /// The value represented by this radio button.
  final T value;

  /// The currently selected value.
  final T? groupValue;

  /// Callback when the radio button is selected.
  final ValueChanged<T?>? onChanged;

  /// Label text displayed next to the radio button.
  final String? label;

  /// Whether the radio button is disabled.
  final bool enabled;

  /// Creates a radio button.
  const UiRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: enabled ? () => onChanged?.call(value) : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RadioWidget(
            isSelected: isSelected,
            enabled: enabled,
            onTap: enabled ? () => onChanged?.call(value) : null,
          ),
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

class _RadioWidget extends StatelessWidget {
  final bool isSelected;
  final bool enabled;
  final VoidCallback? onTap;

  const _RadioWidget({
    required this.isSelected,
    required this.enabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final size = ui.sizes.checkboxSize;
    final innerRadius = (size / 2) - 4.0;

    final borderColor = ui.colors.input;
    final selectedBorderColor = ui.colors.primary;
    final selectedInnerColor = ui.colors.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: enabled
                ? (isSelected ? selectedBorderColor : borderColor)
                : ui.colors.mutedForeground,
            width: 1.0,
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: innerRadius * 2,
                  height: innerRadius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: enabled ? selectedInnerColor : ui.colors.muted,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

/// A group of radio buttons.
///
/// Example:
/// ```dart
/// UiRadioGroup<String>(
///   value: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value),
///   options: [
///     ('option1', 'Option 1'),
///     ('option2', 'Option 2'),
///     ('option3', 'Option 3'),
///   ],
/// )
/// ```
class UiRadioGroup<T> extends StatelessWidget {
  /// The currently selected value.
  final T? value;

  /// Callback when a radio button is selected.
  final ValueChanged<T?>? onChanged;

  /// List of (value, label) tuples.
  final List<(T, String)> options;

  /// Whether the radio group is disabled.
  final bool enabled;

  /// Direction of layout.
  final Axis direction;

  /// Spacing between radio buttons.
  final double spacing;

  /// Creates a radio group.
  const UiRadioGroup({
    super.key,
    required this.value,
    required this.options,
    this.onChanged,
    this.enabled = true,
    this.direction = Axis.vertical,
    this.spacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ui = UiTheme.of(context);

    final widgets = options
        .map(
          (option) => UiRadio<T>(
            value: option.$1,
            groupValue: value,
            onChanged: enabled ? onChanged : null,
            label: option.$2,
            enabled: enabled,
          ),
        )
        .toList();

    final s = UiTheme.of(context).spacing;
    final gap = spacing == 0 ? s.sm : spacing;
    final spacer = SizedBox(
      width: direction == Axis.horizontal ? gap : 0,
      height: direction == Axis.vertical ? gap : 0,
    );

    final children = <Widget>[];
    for (int i = 0; i < widgets.length; i++) {
      children.add(widgets[i]);
      if (i < widgets.length - 1) {
        children.add(spacer);
      }
    }

    if (direction == Axis.horizontal) {
      return Row(mainAxisSize: MainAxisSize.min, children: children);
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
  }
}
