import 'package:hive_flutter/hive_flutter.dart';
import '../../{{name.snakeCase()}}_barrel.dart';
import 'package:{{project_name.snakeCase()}}/core/data/entities/object_entity.dart';

part '{{return_class.snakeCase()}}_entity.g.dart';

@HiveType(typeId: )
class {{return_class.pascalCase()}}Entity extends HiveObject implements ObjectEntity<{{return_class.pascalCase()}}Model>{


@override
{{return_class.pascalCase()}}Model toModel() {
// TODO: implement toModel
throw UnimplementedError();
}
}