import '../../{{feature_name.snakeCase()}}_barrel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class {{feature_name.pascalCase()}}RepositoryImpl<{{return_type.pascalCase()}}>
implements {{feature_name.pascalCase()}}Repository<{{return_type.pascalCase()}}> {
final {{feature_name.pascalCase()}}RemoteDataSource remote;

{{feature_name.pascalCase()}}RepositoryImpl(this.remote);

@override
Future<Either<Failure, T>> {{method_name}}() async {
try {
final response = await remote.{{method_name}}();
return right(response);
} on DioException catch (e) {
return left(mapDioException(e));
}
}
}
