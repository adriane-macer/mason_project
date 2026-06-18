import '../../{{feature_name.snakeCase()}}_barrel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remote;

  {{feature_name.pascalCase()}}RepositoryImpl(this.remote);

  @override
  Future<Either<Failure, {{return_type.pascalCase()}}Entity>> {{method_name.camelCase()}}() async {
    try {
      final response = await remote.{{method_name.camelCase()}}();
      return right(response);
    } on DioException catch (e) {
      return left(mapDioException(e));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
