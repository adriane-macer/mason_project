import 'package:flutter/material.dart';

@immutable
class BrandTokens extends ThemeExtension<BrandTokens> {
  const BrandTokens({
    required this.primaryColor,
    required this.secondaryColor,
    required this.successColor,
    required this.warningColor,
    required this.dangerColor,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color successColor;
  final Color warningColor;
  final Color dangerColor;

  static const defaultBrand = BrandTokens(
    primaryColor: Color(0xFF0066FF),
    secondaryColor: Color(0xFF6B7280),
    successColor: Color(0xFF2ECC71),
    warningColor: Color(0xFFF39C12),
    dangerColor: Color(0xFFE74C3C),
  );

  @override
  BrandTokens copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? successColor,
    Color? warningColor,
    Color? dangerColor,
  }) {
    return BrandTokens(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      successColor: successColor ?? this.successColor,
      warningColor: warningColor ?? this.warningColor,
      dangerColor: dangerColor ?? this.dangerColor,
    );
  }

  @override
  BrandTokens lerp(ThemeExtension<BrandTokens>? other, double t) {
    if (other is! BrandTokens) return this;
    return BrandTokens(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      successColor: Color.lerp(successColor, other.successColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      dangerColor: Color.lerp(dangerColor, other.dangerColor, t)!,
    );
  }
}
