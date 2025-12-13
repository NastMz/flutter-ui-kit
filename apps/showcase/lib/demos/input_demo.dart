import 'package:components/components.dart';
import 'package:flutter/material.dart';

class InputDemo extends StatelessWidget {
  const InputDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UiTextField(placeholder: 'Email'),
          const SizedBox(height: 16),
          const UiTextField(placeholder: 'Password', obscureText: true),
          const SizedBox(height: 16),
          const UiTextField(placeholder: 'Disabled', enabled: false),
          const SizedBox(height: 16),
          UiTextField(
            placeholder: 'With Label',
            controller: TextEditingController(text: 'Initial Value'),
          ),
          const SizedBox(height: 16),
          const UiTextField(
            placeholder: 'With Error',
            errorText: 'Invalid email address',
          ),
        ],
      ),
    );
  }
}
