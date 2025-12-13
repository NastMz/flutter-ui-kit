import 'package:components/components.dart';
import 'package:flutter/material.dart';

class FormFieldDemo extends StatefulWidget {
  const FormFieldDemo({super.key});

  @override
  State<FormFieldDemo> createState() => _FormFieldDemoState();
}

class _FormFieldDemoState extends State<FormFieldDemo> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController streetController;
  late TextEditingController cityController;
  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    streetController = TextEditingController();
    cityController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    streetController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      if (emailController.text.isEmpty) {
        emailError = 'Email is required';
      } else if (!emailController.text.contains('@')) {
        emailError = 'Please enter a valid email';
      } else {
        emailError = null;
      }
    });
  }

  void _validatePassword() {
    setState(() {
      if (passwordController.text.isEmpty) {
        passwordError = 'Password is required';
      } else if (passwordController.text.length < 8) {
        passwordError = 'Password must be at least 8 characters';
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return UiBox(
      width: 400,
      child: VStack(
        crossAxisAlignment: CrossAxisAlignment.start,
        gap: UiSpacing.lg,
        children: [
          // Basic field
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              const UiText.h4('Basic Fields'),
              UiFormFieldInput(
                label: 'Full Name',
                placeholder: 'John Doe',
                controller: nameController,
                helperText: 'Your display name',
              ),
            ],
          ),

          // Required field
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              const UiText.h4('Required Field'),
              UiFormFieldInput(
                label: 'Email',
                required: true,
                placeholder: 'you@example.com',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                errorText: emailError,
                helperText: emailError == null
                    ? 'We\'ll use this to send updates'
                    : null,
              ),
            ],
          ),

          // Field with validation
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              const UiText.h4('With Validation'),
              UiFormFieldInput(
                label: 'Password',
                required: true,
                placeholder: '••••••••',
                controller: passwordController,
                obscureText: true,
                errorText: passwordError,
                helperText: passwordError == null
                    ? 'At least 8 characters'
                    : null,
              ),
              HStack(
                gap: UiSpacing.sm,
                children: [
                  UiButton(
                    onPressed: _validateEmail,
                    variant: UiButtonVariant.secondary,
                    size: UiButtonSize.sm,
                    child: const Text('Validate Email'),
                  ),
                  UiButton(
                    onPressed: _validatePassword,
                    variant: UiButtonVariant.secondary,
                    size: UiButtonSize.sm,
                    child: const Text('Validate Password'),
                  ),
                ],
              ),
            ],
          ),

          // Field group
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              const UiText.h4('Field Group'),
              UiFieldGroup(
                title: 'Address',
                fieldGap: UiSpacing.md,
                children: [
                  UiFormFieldInput(
                    label: 'Street Address',
                    required: true,
                    placeholder: '123 Main St',
                    controller: streetController,
                    helperText: 'Include street number',
                  ),
                  UiFormFieldInput(
                    label: 'City',
                    required: true,
                    placeholder: 'New York',
                    controller: cityController,
                  ),
                  UiFormFieldInput(label: 'ZIP Code', placeholder: '10001'),
                ],
              ),
            ],
          ),

          // Disabled field
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.md,
            children: [
              const UiText.h4('Disabled Field'),
              UiFormFieldInput(
                label: 'Username',
                placeholder: 'john_doe',
                enabled: false,
                helperText: 'Cannot be changed',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
