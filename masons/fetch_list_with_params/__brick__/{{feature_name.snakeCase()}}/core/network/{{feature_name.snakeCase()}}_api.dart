
import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}Api {
  Future<List<{{entity_name.pascalCase()}}Model>> fetch({{feature_name.pascalCase()}}RequestParams requestParams););
}