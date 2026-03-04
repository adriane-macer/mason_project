import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}Api {
  Future<{{return_type.pascalCase()}}Model> {{method_name}}();
}
