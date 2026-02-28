import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase extends UseCase<{{return_type.pascalCase()}}, {{feature_name.pascalCase()}}UseCaseParams>{
final {{feature_name.pascalCase()}}Repository repository;

{{feature_name.pascalCase()}}UseCase(this.repository);

Future<Either<Failure, T>> call({{feature_name.pascalCase()}}UseCaseParams params) {
return repository.{{method_name}}();
}
}

class {{feature_name.pascalCase()}}UseCaseParam{

}