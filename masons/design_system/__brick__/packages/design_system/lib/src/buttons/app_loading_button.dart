import 'package:flutter/material.dart';
import 'app_button.dart';

class AppLoadingButton extends StatelessWidget {
  const AppLoadingButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final Future<void> Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: label,
      loading: isLoading,
      onPressed: onPressed,
    );
  }
}
