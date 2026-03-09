import '{{feature_name.snakeCase()}}_api.dart';

class {{feature_name.pascalCase()}}DemoApi extends {{feature_name.pascalCase()}}Api<{{return_type.pascalCase()}}> {
  @override
  Future<{{return_type.pascalCase()}}> {{method_name.camelCase()}}({{params_type.pascalCase()}} params)async{
    // TODO implement {{method_name}}
  }
}