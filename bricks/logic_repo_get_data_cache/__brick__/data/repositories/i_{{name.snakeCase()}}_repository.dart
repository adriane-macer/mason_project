import '../../{{name.snakeCase()}}_barrel.dart';

abstract class I{{name.pascalCase()}}Repository{
  Future<{{return_class.pascalCase()}}Model> {{method_name.camelCase()}}();
}