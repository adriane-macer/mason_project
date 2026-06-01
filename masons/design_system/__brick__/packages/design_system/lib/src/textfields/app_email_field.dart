import 'package:flutter/material.dart';
import 'app_text_field.dart';

class AppEmailField extends StatelessWidget {
  const AppEmailField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: 'Email',
      labelText: 'Email Address',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      validator: validator ?? _defaultValidator,
      prefixIcon: const Icon(Icons.email),
    );
  }

  String? _defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}
