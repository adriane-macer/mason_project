import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
Future<void> {{method_name}}();
}

class {{feature_name.pascalCase()}}RemoteDataSourceImpl
implements {{feature_name.pascalCase()}}RemoteDataSource {
final {{feature_name.pascalCase()}}Api api;

{{feature_name.pascalCase()}}RemoteDataSourceImpl(this.api);

@override
Future<void> {{method_name.camelCase()}}() async {
await api.{{method_name.camelCase()}}();
}
}
