
import 'package:json_annotation/json_annotation.dart';

part '{{return_class.snakeCase()}}.g.dart';

@JsonSerializable()
class {{return_class.pascalCase()}}{
  //TODO add properties

  factory {{return_class.pascalCase()}}.fromJson(Map<String, dynamic> json) =>
    _${{return_class.pascalCase()}}FromJson(json);

  Map<String, dynamic> toJson() => _${{return_class.pascalCase()}}ToJson(this);
}