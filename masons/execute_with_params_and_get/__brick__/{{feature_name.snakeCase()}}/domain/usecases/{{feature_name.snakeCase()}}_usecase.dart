import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase UseCase<Unit, {{feature_name.pascalCase()}}CaseParams>{
final {{feature_name.pascalCase()}}Repository repository;

{{feature_name.pascalCase()}}UseCase(this.repository);

Future<Either<Failure, Unit>> call({{feature_name.pascalCase()}}CaseParams params) {
return repository.{{method_name}}(
//TODO add params
);
}
}

class {{feature_name.pascalCase()}}CaseParams{
  //TODO add params
{{feature_name.pascalCase()}}CaseParams(
//TODO add params
);
}
