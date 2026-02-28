import 'package:dio/dio.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}RemoteDataSource {
  Future<Either<Failure,List<{{entity_name.pascalCase()}}Model>>> fetch();
}

class {{feature_name.pascalCase()}}RemoteDataSourceImpl
    implements {{feature_name.pascalCase()}}RemoteDataSource {
final GetProductsApi _api;

{{feature_name.pascalCase()}}RemoteDataSourceImpl(this._api);

@override
Future<Either<Failure, List<{{entity_name.pascalCase()}}>>> fetch() async {
try {
final result = await _api.fetch();
return Right(result.map((e) => e.toEntity()).toList());
} on DioException catch (e) {
return left(mapDioException(e));
} catch (e) {
return const Left(UnknownFailure());
}
}
}
