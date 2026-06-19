import 'package:flutter/material.dart';
import '../tokens/brand_tokens.dart';
import '../tokens/light_color_tokens.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_typography.dart';
import '../tokens/app_elevation.dart';

ThemeData createLightTheme({BrandTokens? brand}) {
  final brandTokens = brand ?? BrandTokens.defaultBrand;
  
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: brandTokens.primaryColor,
      secondary: brandTokens.secondaryColor,
      surface: LightColorTokens.surface,
      background: LightColorTokens.background,
      error: LightColorTokens.error,
      onPrimary: LightColorTokens.onPrimary,
      onSecondary: LightColorTokens.onSecondary,
      onSurface: LightColorTokens.onSurface,
      onBackground: LightColorTokens.onBackground,
      onError: LightColorTokens.onError,
      outline: LightColorTokens.outline,
    ),
    extensions: [brandTokens],
    textTheme: AppTypography.textTheme,
    cardTheme: CardThemeData(
      elevation: AppElevation.card.toDouble(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      color: LightColorTokens.surface,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColorTokens.surface,
      foregroundColor: LightColorTokens.onSurface,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: LightColorTokens.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        borderSide: const BorderSide(color: LightColorTokens.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        borderSide: const BorderSide(color: LightColorTokens.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.sm),
        borderSide: BorderSide(color: brandTokens.primaryColor, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: brandTokens.primaryColor,
        foregroundColor: LightColorTokens.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        elevation: 0,
      ),
    ),
  );
}
