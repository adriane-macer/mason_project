import 'package:flutter/material.dart';
import '../tokens/brand_tokens.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  BrandTokens get brand => theme.extension<BrandTokens>()!;

  ColorScheme get colors => theme.colorScheme;

  TextTheme get text => theme.textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  EdgeInsets get padding => mediaQuery.padding;
}