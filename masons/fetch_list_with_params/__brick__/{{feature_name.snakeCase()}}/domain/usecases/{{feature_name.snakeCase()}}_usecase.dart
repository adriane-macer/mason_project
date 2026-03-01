import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase
    extends
    UseCase<
          List<{{entity_name.pascalCase()}}>,{{feature_name.pascalCase()}}Params
        > {
  final {{feature_name.pascalCase()}}Repository repository;

  {{feature_name.pascalCase()}}UseCase(this.repository);

  @override
  Future<Either<Failure, List<{{feature_name.pascalCase()}}>>> call(
RequestParams(
// TODO add params
);
  ) {
    return repository.fetch();
  }
}

class {{entity_name.pascalCase()}}Params extends Equatable {
  // TODO add params

  const {{entity_name.pascalCase()}}Params();

  @override
  List<Object?> get props => [];
}


