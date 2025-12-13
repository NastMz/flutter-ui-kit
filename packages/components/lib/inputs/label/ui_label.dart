import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A label widget for form fields.
///
/// Example:
/// ```dart
/// UiLabel(
///   text: 'Email',
///   required: true,
/// )
/// ```
class UiLabel extends StatelessWidget {
  /// The label text.
  final String text;

  /// Whether this field is required.
  final bool required;

  /// Optional hint text displayed below the label.
  final String? hint;

  /// Creates a label.
  const UiLabel({
    super.key,
    required this.text,
    this.required = false,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: ui.typography.textSm.copyWith(
                fontWeight: FontWeight.w600,
                color: ui.colors.foreground,
              ),
            ),
            if (required) ...[
              SizedBox(width: ui.spacing.xs),
              Text(
                '*',
                style: ui.typography.textSm.copyWith(
                  color: ui.colors.destructive,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
        if (hint != null) ...[
          SizedBox(height: ui.spacing.xs),
          Text(
            hint!,
            style: ui.typography.textSm.copyWith(
              color: ui.colors.mutedForeground,
            ),
          ),
        ],
      ],
    );
  }
}
