import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}Repository extends Mock implements
{{feature_name.pascalCase()}}Repository {}

void main() {
  late Mock{{feature_name.pascalCase()}}Repository repository;
  late {{feature_name.pascalCase()}}UseCase {{feature_name.camelCase()}}UseCase;


  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repository();
    {{feature_name.camelCase()}}UseCase = {{feature_name.pascalCase()}}UseCase(repository);
  });

  test('delegates call to repository', () async {
    when(() => repository.{{method_name}}())
        .thenAnswer((_) async => right(unit));

    final result = await {{feature_name.camelCase()}}UseCase();

    expect(result, right(unit));
  });
}