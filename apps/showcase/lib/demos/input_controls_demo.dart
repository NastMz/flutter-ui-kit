import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  bool _isChecked = false;
  bool _isChecked2 = true;
  bool _isSwitchEnabled = false;
  bool _isSwitchEnabled2 = true;
  String _selectedRadio = 'option1';

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return SizedBox(
      width: 400,
      child: VStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        gap: UiSpacing.lg,
        children: [
          // Checkbox section
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.p(
                'Checkboxes',
                style: ui.typography.textSm.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              UiCheckbox(
                value: _isChecked,
                onChanged: (value) => setState(() => _isChecked = value),
                label: 'Accept terms and conditions',
              ),
              UiCheckbox(
                value: _isChecked2,
                onChanged: (value) => setState(() => _isChecked2 = value),
                label: 'Subscribe to newsletter',
              ),
              UiCheckbox(
                value: true,
                enabled: false,
                label: 'Disabled checkbox',
              ),
            ],
          ),

          // Switch section
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.p(
                'Switches',
                style: ui.typography.textSm.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              UiSwitch(
                value: _isSwitchEnabled,
                onChanged: (value) => setState(() => _isSwitchEnabled = value),
                label: 'Enable notifications',
              ),
              UiSwitch(
                value: _isSwitchEnabled2,
                onChanged: (value) => setState(() => _isSwitchEnabled2 = value),
                label: 'Dark mode',
              ),
              UiSwitch(value: true, enabled: false, label: 'Disabled switch'),
            ],
          ),

          // Radio Group section
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.p(
                'Radio Buttons',
                style: ui.typography.textSm.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              UiRadioGroup<String>(
                value: _selectedRadio,
                onChanged: (value) =>
                    setState(() => _selectedRadio = value ?? 'option1'),
                options: const [
                  ('option1', 'Option 1'),
                  ('option2', 'Option 2'),
                  ('option3', 'Option 3'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
