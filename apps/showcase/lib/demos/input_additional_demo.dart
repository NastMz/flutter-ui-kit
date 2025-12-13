import 'package:components/components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class InputAdditionalDemo extends StatefulWidget {
  const InputAdditionalDemo({super.key});

  @override
  State<InputAdditionalDemo> createState() => _InputAdditionalDemoState();
}

class _InputAdditionalDemoState extends State<InputAdditionalDemo> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ui = UiTheme.of(context);

    return UiBox(
      width: 400,
      child: VStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        gap: UiSpacing.xl,
        children: [
          // Labels section
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Labels'),
              VStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                gap: UiSpacing.md,
                children: [
                  UiLabel(text: 'Required Field', required: true),
                  UiLabel(text: 'Optional Field', required: false),
                  UiLabel(
                    text: 'With Helper Text',
                    hint: 'This provides additional context',
                  ),
                ],
              ),
            ],
          ),

          // Textarea section
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Textarea'),
              VStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                gap: UiSpacing.md,
                children: [
                  UiTextarea(
                    controller: _messageController,
                    label: 'Standard',
                    placeholder: 'Enter your text here...',
                  ),
                  UiTextarea(
                    label: 'With Helper Text',
                    placeholder: 'Provide details',
                    helperText: 'Maximum 500 characters',
                  ),
                  UiTextarea(
                    label: 'Error State',
                    placeholder: 'This field has an error',
                    errorText: 'This field is required',
                  ),
                ],
              ),
            ],
          ),

          // Separator section
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              UiText.h4('Separator'),
              VStack(
                crossAxisAlignment: CrossAxisAlignment.start,
                gap: UiSpacing.md,
                children: [
                  UiText.small(
                    'Horizontal',
                    style: ui.typography.textSm.copyWith(
                      color: ui.colors.mutedForeground,
                    ),
                  ),
                  UiSeparator(),
                  UiText.small(
                    'Vertical (inline)',
                    style: ui.typography.textSm.copyWith(
                      color: ui.colors.mutedForeground,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: HStack(
                      gap: UiSpacing.md,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Left', style: ui.typography.textSm),
                        UiSeparator(direction: UiSeparatorDirection.vertical),
                        Text('Right', style: ui.typography.textSm),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
