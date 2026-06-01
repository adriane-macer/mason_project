import 'package:flutter/material.dart';
import 'app_text_field.dart';

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    this.controller,
    this.validator,
    this.hintText = 'Password',
    this.labelText = 'Password',
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final String labelText;
  final ValueChanged<String>? onChanged;

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _obscure,
      hintText: widget.hintText,
      labelText: widget.labelText,
      onChanged: widget.onChanged,
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },
        icon: Icon(
          _obscure ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}
