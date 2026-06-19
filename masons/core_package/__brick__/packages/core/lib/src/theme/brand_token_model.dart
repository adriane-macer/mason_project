import 'package:json_annotation/json_annotation.dart';

part 'brand_token_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BrandTokenModel {
  const BrandTokenModel({
    required this.primaryColor,
    required this.secondaryColor,
    required this.successColor,
    required this.warningColor,
    required this.dangerColor,
  });

  final String primaryColor;
  final String secondaryColor;
  final String successColor;
  final String warningColor;
  final String dangerColor;

  factory BrandTokenModel.fromJson(Map<String, dynamic> json) =>
      _$BrandTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandTokenModelToJson(this);
}
