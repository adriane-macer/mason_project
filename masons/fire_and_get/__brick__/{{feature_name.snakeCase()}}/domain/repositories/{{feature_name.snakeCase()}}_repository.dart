import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}Repository<{{return_type.pascalCase()}}>  {
Future<Either<Failure, {{return_type.pascalCase()}}>> {{method_name}}();
}
