import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}Repository {
  Stream<Either<Failure, {{return_type.pascalCase()}}Entity>> {{method_name}}();
}
