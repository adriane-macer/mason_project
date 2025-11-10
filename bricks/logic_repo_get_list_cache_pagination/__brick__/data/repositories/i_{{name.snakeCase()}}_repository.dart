import '../../{{name.snakeCase()}}_barrel.dart';

abstract class I{{name.pascalCase()}}Repository{
  Future<(List<{{return_class.pascalCase()}}Model>,String?)> {{method_name.camelCase()}}({required String? cursor, int? limit});
}