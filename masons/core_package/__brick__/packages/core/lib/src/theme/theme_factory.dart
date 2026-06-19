import 'dart:convert';
import 'package:flutter/material.dart';
import 'brand_token_model.dart';

class ThemeFactory {
  static BrandTokenModel parseTokens(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return BrandTokenModel.fromJson(json);
  }

  static Color hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
