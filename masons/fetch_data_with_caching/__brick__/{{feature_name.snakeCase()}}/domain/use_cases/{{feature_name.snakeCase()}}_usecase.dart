import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase extends UseCaseStream<{{return_type.pascalCase()}}Entity, GetWalletUseCaseParams> {
  final {{feature_name.pascalCase()}}Repository repository;

  {{feature_name.pascalCase()}}UseCase(this.repository);

  @override
  Stream<Either<Failure, {{return_type.pascalCase()}}Entity>> call(GetWalletUseCaseParams params) {
    return repository.{{method_name}}();
  }
}

class GetWalletUseCaseParams {}
