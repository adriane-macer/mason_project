
import 'package:json_annotation/json_annotation.dart';

part '{{return_class.snakeCase()}}_model.g.dart';

@JsonSerializable()
class {{return_class.pascalCase()}}Model{
  //TODO add properties

  factory {{return_class.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
    _${{return_class.pascalCase()}}Model.FromJson(json);

  Map<String, dynamic> toJson() => _${{return_class.pascalCase()}}ModelToJson(this);
}