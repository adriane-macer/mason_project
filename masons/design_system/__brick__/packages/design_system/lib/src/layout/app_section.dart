import 'package:flutter/material.dart';
import '../tokens/app_spacing.dart';

class AppSection extends StatelessWidget {
  const AppSection({
    super.key,
    this.title,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.md),
  });

  final String? title;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          child,
        ],
      ),
    );
  }
}
