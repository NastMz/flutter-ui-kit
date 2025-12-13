import 'package:components/components.dart';
import 'package:flutter/material.dart';

class InputDemo extends StatelessWidget {
  const InputDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: VStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          const UiTextField(placeholder: 'Email'),
          const UiTextField(placeholder: 'Password', obscureText: true),
          const UiTextField(placeholder: 'Disabled', enabled: false),
          UiTextField(
            placeholder: 'With Label',
            controller: TextEditingController(text: 'Initial Value'),
          ),
          const UiTextField(
            placeholder: 'With Error',
            errorText: 'Invalid email address',
          ),
        ],
      ),
    );
  }
}
