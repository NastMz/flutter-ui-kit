import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A switch widget that follows the design system.
///
/// Example:
/// ```dart
/// UiSwitch(
///   value: isEnabled,
///   onChanged: (value) => setState(() => isEnabled = value),
///   label: 'Enable notifications',
/// )
/// ```
class UiSwitch extends StatelessWidget {
  /// Whether the switch is enabled/on.
  final bool value;

  /// Callback when the switch state changes.
  final ValueChanged<bool>? onChanged;

  /// Label text displayed next to the switch.
  final String? label;

  /// Whether the switch is disabled.
  final bool enabled;

  /// Creates a switch.
  const UiSwitch({
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
          _SwitchWidget(value: value, enabled: enabled, onChanged: onChanged),
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

class _SwitchWidget extends StatefulWidget {
  final bool value;
  final bool enabled;
  final ValueChanged<bool>? onChanged;

  const _SwitchWidget({
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  @override
  State<_SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<_SwitchWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
      value: widget.value ? 1 : 0,
    );
  }

  @override
  void didUpdateWidget(_SwitchWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);
    final height = ui.sizes.switchHeight;
    final width = ui.sizes.switchWidth;
    final thumbRadius = (height / 2) - 2.0;

    final offBgColor = ui.colors.mutedForeground;
    final onBgColor = ui.colors.primary;
    final thumbColor = ui.colors.background;

    return GestureDetector(
      onTap: widget.enabled
          ? () {
              if (widget.value) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
              widget.onChanged?.call(!widget.value);
            }
          : null,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final translateX =
              (_controller.value * (width - thumbRadius * 2 - 4));

          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2),
              color: widget.enabled
                  ? Color.lerp(offBgColor, onBgColor, _controller.value) ??
                        onBgColor
                  : ui.colors.mutedForeground.withValues(alpha: 0.5),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 2 + translateX,
                  top: 2,
                  child: Container(
                    width: thumbRadius * 2,
                    height: thumbRadius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: thumbColor,
                      boxShadow: [
                        BoxShadow(
                          color: ui.colors.foreground.withValues(alpha: 0.1),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
