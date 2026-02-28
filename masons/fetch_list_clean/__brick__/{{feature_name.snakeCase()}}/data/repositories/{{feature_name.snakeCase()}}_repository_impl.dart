import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}RepositoryImpl
    implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource;

{{feature_name.pascalCase()}}RepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<{{entity_name.pascalCase()}}>>> fetch() async {
    try {
      final result = await remoteDataSource.fetch();
      return right(
result.map((element)=>element.toEntity()).toList()
      );
    } on DioException catch (e) {
      return left(mapDioException(e));
    } catch (_) {
      return left(const UnknownFailure());
    }
  }
}
