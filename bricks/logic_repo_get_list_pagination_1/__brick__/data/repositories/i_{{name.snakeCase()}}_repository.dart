import '../../{{name.snakeCase()}}_barrel.dart';

abstract class I{{name.pascalCase()}}Repository{
  Future<List<{{return_class.pascalCase()}}>> {{method_name.camelCase()}}({int offset = 0, String sorted = "DSC", int limit = 10});
}