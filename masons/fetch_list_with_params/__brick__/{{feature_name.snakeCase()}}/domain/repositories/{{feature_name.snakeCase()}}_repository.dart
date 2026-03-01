import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Future<Either<Failure, List<{{entity_name.pascalCase()}}>>> fetch({{feature_name.pascalCase()}}RequestParams requestParams);
}
