import '{{feature_name.snakeCase()}}_api.dart';

class {{feature_name.pascalCase()}}RemoteApi extends {{feature_name.pascalCase()}}Api<T> {
  @override
  Future<{{return_type.pascalCase()}}> {{method_name.camelCase()}}({{params_type.pascalCase()}} params)async{
    // TODO implement {{method_name}}
  }
}