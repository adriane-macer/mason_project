import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class Mock{{feature_name.pascalCase()}}UseCase extends Mock implements {{feature_name.pascalCase()}}UseCase {}

void main() {
  late Mock{{feature_name.pascalCase()}}UseCase useCase;
  late {{feature_name.pascalCase()}}Cubit cubit;

  setUp(() {
    useCase = Mock{{feature_name.pascalCase()}}UseCase();
    cubit = {{feature_name.pascalCase()}}Cubit(useCase);
    registerFallbackValue({{feature_name.pascalCase()}}UseCaseParams());
  });

  tearDown(() {
    cubit.close();
  });

  blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
    'emits [loading, success] when data is fetched successfully',
    build: () {
      when(() => useCase(any())).thenAnswer((_) async => right(const {{return_type.pascalCase()}}Model()));
      return cubit;
    },
    act: (cubit) => cubit.{{method_name.camelCase()}}(),
    expect: () => [
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success, data: {{return_type.pascalCase()}}Model()),
    ],
  );

  blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
    'emits [loading, error] when data fetch fails',
    build: () {
      when(() => useCase(any())).thenAnswer((_) async => left(const ServerFailure(message: 'error')));
      return cubit;
    },
    act: (cubit) => cubit.{{method_name.camelCase()}}(),
    expect: () => [
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
      const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.error, error: 'error'),
    ],
  );
}
