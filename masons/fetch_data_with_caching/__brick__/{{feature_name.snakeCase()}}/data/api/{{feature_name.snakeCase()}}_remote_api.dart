import '{{feature_name.snakeCase()}}_api.dart';

class {{feature_name.pascalCase()}}RemoteApi implements {{feature_name.pascalCase()}}Api {
  @override
  Future<{{return_type.pascalCase()}}Model> {{method_name}}() async {
    // TODO: implement {{method_name}}
    throw UnimplementedError();
  }
}
