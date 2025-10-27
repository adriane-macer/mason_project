import '../../{{name.snakeCase()}}_barrel.dart';

abstract class I{{name.pascalCase()}}Repository{
  Future<{{return_class.pascalCase()}}> {{method_name.camelCase()}}();
}