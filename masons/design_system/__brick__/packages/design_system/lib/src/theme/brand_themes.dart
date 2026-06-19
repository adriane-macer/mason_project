import 'package:flutter/material.dart';
import '../tokens/brand_tokens.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

abstract final class BrandThemes {
  /// Default Light Theme
  static ThemeData get light => createLightTheme(brand: BrandTokens.defaultBrand);

  /// Default Dark Theme
  static ThemeData get dark => createDarkTheme(brand: BrandTokens.defaultBrand);

  /// Creates a Light Theme with custom branding
  static ThemeData lightWithBrand(BrandTokens brand) => createLightTheme(brand: brand);

  /// Creates a Dark Theme with custom branding
  static ThemeData darkWithBrand(BrandTokens brand) => createDarkTheme(brand: brand);
}
