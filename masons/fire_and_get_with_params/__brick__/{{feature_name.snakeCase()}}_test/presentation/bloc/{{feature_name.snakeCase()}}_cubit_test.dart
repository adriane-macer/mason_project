import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class Mock{{feature_name.pascalCase()}}Repository extends Mock implements
{{feature_name.pascalCase()}}Repository {}
class Mock{{params_type.pascalCase()}} extends Mock implements {{params_type.pascalCase()}} {}

void main() {
  late Mock{{feature_name.pascalCase()}}Repository repository;
  late {{feature_name.pascalCase()}}UseCase {{feature_name.camelCase()}}UseCase;
  late {{feature_name.pascalCase()}}Cubit cubit;
  late Mock{{params_type.pascalCase()}} params;

  setUp(() {
    repository = Mock{{feature_name.pascalCase()}}Repository();
    {{feature_name.camelCase()}}UseCase = {{feature_name.pascalCase()}}UseCase(repository);
    cubit = {{feature_name.pascalCase()}}Cubit({{feature_name.camelCase()}}UseCase);
    params = Mock{{params_type.pascalCase()}}();
  });

  tearDown(() {
    cubit.close();
  });


  blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
    'emits loading → success',
    build: () {
      when(() => repository.{{method_name.camelCase()}}(params)).thenAnswer((_) async => right(unit));
      return cubit;
    },
    act: (cubit) => cubit.{{method_name.camelCase()}}(params),
    expect: () => [
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success),
    ],
  );
}
