import '{{feature_name.snakeCase()}}_api.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}DemoApi extends {{feature_name.pascalCase()}}Api {
  @override
  Future<{{return_type.pascalCase()}}Model> {{method_name}}({{params_type.pascalCase()}} params) async {
    // TODO: implement {{method_name}}
    throw UnimplementedError();
  }
}
