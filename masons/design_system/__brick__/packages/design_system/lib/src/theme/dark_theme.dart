import 'package:flutter/material.dart';
import '../tokens/brand_tokens.dart';
import '../tokens/dark_color_tokens.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_typography.dart';

ThemeData createDarkTheme({BrandTokens? brand}) {
  final brandTokens = brand ?? BrandTokens.defaultBrand;

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: brandTokens.primaryColor,
      secondary: brandTokens.secondaryColor,
      surface: DarkColorTokens.surface,
      background: DarkColorTokens.background,
      error: DarkColorTokens.error,
      onPrimary: DarkColorTokens.onPrimary,
      onSecondary: DarkColorTokens.onSecondary,
      onSurface: DarkColorTokens.onSurface,
      onBackground: DarkColorTokens.onBackground,
      onError: DarkColorTokens.onError,
      outline: DarkColorTokens.outline,
    ),
    extensions: [brandTokens],
    textTheme: AppTypography.textTheme,
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      color: DarkColorTokens.surface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkColorTokens.surface,
      foregroundColor: DarkColorTokens.onSurface,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: DarkColorTokens.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        borderSide: const BorderSide(color: DarkColorTokens.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        borderSide: const BorderSide(color: DarkColorTokens.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        borderSide: BorderSide(color: brandTokens.primaryColor, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brandTokens.primaryColor,
        foregroundColor: DarkColorTokens.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        elevation: 0,
      ),
    ),
  );
}
