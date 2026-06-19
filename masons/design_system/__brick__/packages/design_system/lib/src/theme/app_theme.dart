import 'dart:developer';

import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_radius.dart';
import '../tokens/app_typography.dart';
import '../tokens/app_elevation.dart';
import '../tokens/brand_tokens.dart';

class AppTheme {
  static ThemeData light({BrandTokens? brand}) {
    final primary = brand?.primaryColor ?? AppColors.primary;
    final surface = AppColors.surface;
    final background = AppColors.background;

    log(brand?.primaryColor.toString()??"");

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
        surface: surface,
        background: background,
      ),
      extensions: [
        brand ?? const BrandTokens(
          primaryColor: AppColors.primary,
          secondaryColor: Color(0xFF6B7280),
          successColor: AppColors.success,
          warningColor: AppColors.warning,
          dangerColor: AppColors.danger,
        ),
      ],
      textTheme: AppTypography.textTheme,
      cardTheme: CardThemeData(
        elevation: AppElevation.card.toDouble(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
          borderSide: const BorderSide(color: AppColors.textSecondary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      ),
    );
  }

  static ThemeData dark({BrandTokens? brand}) {
    final primary = brand?.primaryColor ?? AppColors.primary;
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.dark,
      ),
      extensions: [
        brand ?? const BrandTokens(
          primaryColor: AppColors.primary,
          secondaryColor: Color(0xFF9CA3AF),
          successColor: AppColors.success,
          warningColor: AppColors.warning,
          dangerColor: AppColors.danger,
        ),
      ],
      textTheme: AppTypography.textTheme,
    );
  }
}
