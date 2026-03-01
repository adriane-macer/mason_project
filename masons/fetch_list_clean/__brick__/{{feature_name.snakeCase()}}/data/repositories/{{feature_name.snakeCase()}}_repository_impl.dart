import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}RepositoryImpl
    implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remoteDataSource;

{{feature_name.pascalCase()}}RepositoryImpl(this.remoteDataSource);

  @override
Future<Either<Failure, List<{{entity_name.pascalCase()}}>>> fetch() => remoteDataSource.fetch();
}
