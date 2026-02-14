import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';


class Mock{{feature_name.pascalCase()}}Repository extends Mock implements
{{feature_name.pascalCase()}}Repository {}

void main() {
  late Mock{{feature_name.pascalCase()}}Repository repository;
  late {{feature_name.pascalCase()}}UseCase {{feature_name.camelCase()}}UseCase;
  late {{feature_name.pascalCase()}}Cubit cubit;

  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repository();
    {{feature_name.camelCase()}}UseCase = {{feature_name.pascalCase()}}UseCase(repository);
    cubit = {{feature_name.pascalCase()}}Cubit({{feature_name.camelCase()}}UseCase);
  });

  tearDown(() {
    cubit.close();
  });


  blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
    'emits loading → success',
    build: () {
      when(() => repository.{{method_name.camelCase()}}()).thenAnswer((_) async => right(unit));
      return cubit;
    },
    act: (cubit) => cubit.{{method_name.camelCase()}}(),
    expect: () => [
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success),
    ],
  );
}
