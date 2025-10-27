import '../../{{name.snakeCase()}}_barrel.dart';

abstract class I{{name.pascalCase()}}Repository{
  Future<{{return_class.snakeCase()}}> {{method_name.snakeCase()}}();
}