import '../../{{feature_name.snakeCase()}}_barrel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class {{feature_name.pascalCase()}}RepositoryImpl
implements {{feature_name.pascalCase()}}Repository {
final {{feature_name.pascalCase()}}RemoteDataSource remote;

{{feature_name.pascalCase()}}RepositoryImpl(this.remote);

@override
Future<Either<Failure, Unit>> {{method_name.camelCase()}}() async {
try {
await remote.{{method_name.camelCase()}}();
return right(unit);
} on DioException catch (e) {
return left(mapDioException(e));
}
}
}
