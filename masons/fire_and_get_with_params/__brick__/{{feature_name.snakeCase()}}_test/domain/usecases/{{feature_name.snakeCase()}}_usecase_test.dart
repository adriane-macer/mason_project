import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class Mock{{feature_name.pascalCase()}}Repository<T>  extends Mock implements
{{feature_name.pascalCase()}}Repository<T>  {}
class Mock{{params_type.pascalCase()}} extends Mock implements {{params_type.pascalCase()}} {}

void main() {
  late Mock{{feature_name.pascalCase()}}Repository<T>  repository;
  late {{feature_name.pascalCase()}}UseCase {{feature_name.camelCase()}}UseCase;
  late Mock{{params_type.pascalCase()}} params;


  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repository<T> ();
    {{feature_name.camelCase()}}UseCase = {{feature_name.pascalCase()}}UseCase(repository);
    params = Mock{{params_type.pascalCase()}}();
  });

  test('delegates call to repository', () async {
    when(() => repository.{{method_name.camelCase()}}(params))
        .thenAnswer((_) async => right(unit));

    final result = await {{feature_name.camelCase()}}UseCase(params);

    expect(result, right(unit));
  });
}
