// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandTokenModel _$BrandTokenModelFromJson(Map<String, dynamic> json) =>
    BrandTokenModel(
      primaryColor: json['primary_color'] as String,
      secondaryColor: json['secondary_color'] as String,
      successColor: json['success_color'] as String,
      warningColor: json['warning_color'] as String,
      dangerColor: json['danger_color'] as String,
    );

Map<String, dynamic> _$BrandTokenModelToJson(BrandTokenModel instance) =>
    <String, dynamic>{
      'primary_color': instance.primaryColor,
      'secondary_color': instance.secondaryColor,
      'success_color': instance.successColor,
      'warning_color': instance.warningColor,
      'danger_color': instance.dangerColor,
    };
