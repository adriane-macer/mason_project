import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase
    extends
    UseCaseNoParam<
          List<{{entity_name.pascalCase()}}>,
          NoParams
        > {
  final {{feature_name.pascalCase()}}Repository repository;

  {{feature_name.pascalCase()}}UseCase(this.repository);

  @override
  Future<Either<Failure, List<{{entity_name.pascalCase()}}>>> call(

  ) {
    return repository.fetch();
  }
}


