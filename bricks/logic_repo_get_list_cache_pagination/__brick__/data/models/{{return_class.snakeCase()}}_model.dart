
import 'package:json_annotation/json_annotation.dart';
import '../../{{name.snakeCase()}}_barrel.dart';
part '{{return_class.snakeCase()}}_model.g.dart';

@JsonSerializable()
class {{return_class.pascalCase()}}Model extends ObjectModel<{{return_class.pascalCase()}}Entity>{
  //TODO add properties

  factory {{return_class.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
    _${{return_class.pascalCase()}}ModelFromJson(json);

  Map<String, dynamic> toJson() => _${{return_class.pascalCase()}}ModelToJson(this);

@override
{{return_class.pascalCase()}}Entity toEntity() {
// TODO: implement toModel
throw UnimplementedError();
}
}