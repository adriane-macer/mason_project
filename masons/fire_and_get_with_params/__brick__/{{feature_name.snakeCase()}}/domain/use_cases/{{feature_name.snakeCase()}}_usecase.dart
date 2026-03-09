import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase extends UseCase<{{return_type.pascalCase()}}, {{params_type.pascalCase()}}>{
final {{feature_name.pascalCase()}}Repository repository;

{{feature_name.pascalCase()}}UseCase(this.repository);

@override
Future<Either<Failure, {{return_type.pascalCase()}}>> call({{params_type.pascalCase()}} params) {
return repository.{{method_name}}(params);
}
}

class {{params_type.pascalCase()}}{

}
