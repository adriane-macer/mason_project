import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource<{{return_type.pascalCase()}}>  {
Future<{{return_type.pascalCase()}}> {{method_name}}({{params_type.pascalCase()}} params);
}

class {{feature_name.pascalCase()}}RemoteDataSourceImpl
implements {{feature_name.pascalCase()}}RemoteDataSource<{{return_type.pascalCase()}}> {
final {{feature_name.pascalCase()}}Api api;

{{feature_name.pascalCase()}}RemoteDataSourceImpl(this.api);

@override
Future<{{return_type.pascalCase()}}> {{method_name}}({{params_type.pascalCase()}} params) async {
return await api.{{method_name}}(params);
}
}
