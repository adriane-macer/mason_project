import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}UseCase extends Mock
    implements {{feature_name.pascalCase()}}UseCase {}

void main() {
  late Mock{{feature_name.pascalCase()}}UseCase useCase;
  late List<
{{entity_name.pascalCase()}}> successResult;

  setUpAll(() {
    registerFallbackValue(const {{feature_name.pascalCase()}}Params());
  });

  setUp(() {
    useCase = Mock{{feature_name.pascalCase()}}UseCase();
    successResult = const List<{{entity_name.pascalCase()}}>(
      items: [
  {{entity_name.pascalCase()}}(
          id: 1,
        ),
      ],
      totalCount: 1,
      hasMore: false,
    );
  });

  blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
    'emits loading then success for initial fetch',
    build: () {
      when(() => useCase(any())).thenAnswer((_) async => right(successResult));
      return {{feature_name.pascalCase()}}Cubit(useCase);
    },
    act: (cubit) => cubit.fetchInitial(),
    expect: () => [
      const {{feature_name.pascalCase()}}State(
        status: {{feature_name.pascalCase()}}Status.loading,
      ),
      {{feature_name.pascalCase()}}State(
        status: {{feature_name.pascalCase()}}Status.success,
        data: successResult,
      ),
    ],
  );

  blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
    'emits refreshing then success on refresh',
    build: () {
      when(() => useCase(any())).thenAnswer((_) async => right(successResult));
      return {{feature_name.pascalCase()}}Cubit(useCase);
    },
    seed: () => {{feature_name.pascalCase()}}State(
      status: {{feature_name.pascalCase()}}Status.success,
      data: successResult,
    ),
    act: (cubit) => cubit.refresh(),
    expect: () => [
      {{feature_name.pascalCase()}}State(
        status: {{feature_name.pascalCase()}}Status.refreshing,
        data: successResult,
      ),
      {{feature_name.pascalCase()}}State(
        status: {{feature_name.pascalCase()}}Status.success,
        data: successResult,
      ),
    ],
  );

  blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
    'emits failure when usecase fails',
    build: () {
      when(
        () => useCase(any()),
      ).thenAnswer((_) async => left(const ServerFailure()));
      return {{feature_name.pascalCase()}}Cubit(useCase);
    },
    act: (cubit) => cubit.fetchInitial(),
    expect: () => [
      const {{feature_name.pascalCase()}}State(
        status: {{feature_name.pascalCase()}}Status.loading,
      ),
      const {{feature_name.pascalCase()}}State(
        status: {{feature_name.pascalCase()}}Status.failure,
        failure: ServerFailure(),
      ),
    ],
  );
}
