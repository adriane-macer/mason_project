import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase extends UseCase<{{return_type.pascalCase()}}Entity, {{feature_name.pascalCase()}}UseCaseParams> {
  final {{feature_name.pascalCase()}}Repository repository;

  {{feature_name.pascalCase()}}UseCase(this.repository);

  @override
  Future<Either<Failure, {{return_type.pascalCase()}}Entity>> call({{feature_name.pascalCase()}}UseCaseParams params) {
    return repository.{{method_name.camelCase()}}();
  }
}

class {{feature_name.pascalCase()}}UseCaseParams {}
