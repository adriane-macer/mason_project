import '../../{{name.snakeCase()}}_barrel.dart';

abstract class I{{name.pascalCase()}}Repository{
  /// (List<{{return_class.pascalCase()}}, cursor?)
  Future<(List<{{return_class.pascalCase()}}>, String?)> {{method_name.camelCase()}}({ int limit = 10, String? cursor});
}