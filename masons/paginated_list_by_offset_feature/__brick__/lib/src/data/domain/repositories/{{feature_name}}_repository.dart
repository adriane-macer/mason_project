import 'package:dartz/dartz.dart';

abstract class {{feature_name.pascalCase()}}Repository {
Future<Either<Failure, List<{{feature_name.pascalCase()}}>>> getList({
required int offset,
required int limit,
Map<String, dynamic>? filters,
});
}
