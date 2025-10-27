import 'package:hiraya/core/data/entities/object_entity.dart';
import 'package:hiraya/features/get_employment_status/data/models/employment_status_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part '{{return_class.snakeCase()}}_entity.g.dart';

@HiveType(typeId: )  // TODO add type id
class {{return_class.pascalCase()}}Entity extends HiveObject {

  //TODO add properties


  @override
  {{return_class.pascalCase()}}Model toModel() {
    // TODO implement code
  }

  {{return_class.pascalCase()}}Model copyWith({
// TODO add properties
  }) {
    // TODO implement code
  }
}
