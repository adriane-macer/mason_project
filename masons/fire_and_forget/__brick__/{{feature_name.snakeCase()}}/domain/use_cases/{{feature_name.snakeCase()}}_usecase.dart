import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}UseCase {
final {{feature_name.pascalCase()}}Repository repository;

{{feature_name.pascalCase()}}UseCase(this.repository);

Future<Either<Failure, Unit>> call() {
return repository.{{method_name}}();
}
}
