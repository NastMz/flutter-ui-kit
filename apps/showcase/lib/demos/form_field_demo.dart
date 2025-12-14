import 'package:components/components.dart';
import 'package:flutter/material.dart';

class FormFieldDemo extends StatefulWidget {
  const FormFieldDemo({super.key});

  @override
  State<FormFieldDemo> createState() => _FormFieldDemoState();
}

class _FormFieldDemoState extends State<FormFieldDemo> {
  // Controlled mode (shadcn-like) - recommended
  String fullName = '';
  String email = '';
  String password = '';
  String street = '';
  String city = '';
  String zipCode = '';
  String? emailError;
  String? passwordError;

  String? _validateEmailValue(String value) {
    if (value.isEmpty) return 'Email is required';
    if (!value.contains('@')) return 'Please enter a valid email';
    return null;
  }

  String? _validatePasswordValue(String value) {
    if (value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    return null;
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
                value: fullName,
                onChanged: (value) => setState(() => fullName = value),
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
              UiFormFieldInput.email(
                label: 'Email',
                placeholder: 'johndoe@email.com',
                required: true,
                value: email,
                onChanged: (value) => setState(() {
                  email = value;
                  emailError = _validateEmailValue(value);
                }),
                onSubmitted: (_) => setState(() {
                  emailError = _validateEmailValue(email);
                }),
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
              UiFormFieldInput.password(
                label: 'Password',
                required: true,
                value: password,
                onChanged: (value) => setState(() {
                  password = value;
                  passwordError = _validatePasswordValue(value);
                }),
                onSubmitted: (_) => setState(() {
                  passwordError = _validatePasswordValue(password);
                }),
                errorText: passwordError,
                helperText: passwordError == null
                    ? 'At least 8 characters'
                    : null,
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
                    value: street,
                    onChanged: (value) => setState(() => street = value),
                    helperText: 'Include street number',
                  ),
                  UiFormFieldInput(
                    label: 'City',
                    required: true,
                    placeholder: 'New York',
                    value: city,
                    onChanged: (value) => setState(() => city = value),
                  ),
                  UiFormFieldInput.number(
                    label: 'ZIP Code',
                    placeholder: '10001',
                    value: zipCode,
                    onChanged: (value) => setState(() => zipCode = value),
                  ),
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

          // Display form data
          VStack(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: UiSpacing.sm,
            children: [
              const UiText.h4('Form Data'),
              UiText.small('Name: $fullName'),
              UiText.small('Email: $email'),
              UiText.small('Address: $street, $city $zipCode'),
            ],
          ),
        ],
      ),
    );
  }
}
