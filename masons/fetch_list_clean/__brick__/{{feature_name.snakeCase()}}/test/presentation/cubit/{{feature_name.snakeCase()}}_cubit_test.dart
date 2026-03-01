import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}UseCase extends Mock implements {{feature_name.pascalCase()}}UseCase {}

void main() {
  late Mock{{feature_name.pascalCase()}}UseCase mockUseCase;
  late {{feature_name.pascalCase()}}Cubit cubit;

  setUp(() {
    mockUseCase = Mock{{feature_name.pascalCase()}}UseCase();
    cubit = {{feature_name.pascalCase()}}Cubit(mockUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  const t{{entity_name.pascalCase()}}s = [{{entity_name.pascalCase()}}(id: 1)];

  test('initial state should be {{feature_name.pascalCase()}}State.initial()', () {
    expect(cubit.state, const {{feature_name.pascalCase()}}State.initial());
  });

  group('fetchInitial', () {
    blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      'emits [loading, success] when useCase returns data',
      build: () {
        when(() => mockUseCase()).thenAnswer((_) async => const Right(t{{entity_name.pascalCase()}}s));
        return cubit;
      },
      act: (cubit) => cubit.fetchInitial(),
      expect: () => [
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success, data: t{{entity_name.pascalCase()}}s),
      ],
      verify: (_) {
        verify(() => mockUseCase()).called(1);
      },
    );

    blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      'emits [loading, failure] when useCase returns failure',
      build: () {
        when(() => mockUseCase()).thenAnswer((_) async => const Left(ServerFailure()));
        return cubit;
      },
      act: (cubit) => cubit.fetchInitial(),
      expect: () => [
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.failure, failure: ServerFailure()),
      ],
    );
  });

  group('refresh', () {
    blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      'emits [refreshing, success] when useCase returns data',
      build: () {
        when(() => mockUseCase()).thenAnswer((_) async => const Right(t{{entity_name.pascalCase()}}s));
        return cubit;
      },
      act: (cubit) => cubit.refresh(),
      expect: () => [
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.refreshing),
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success, data: t{{entity_name.pascalCase()}}s),
      ],
    );
  });

  group('fetchInitialDebounced', () {
    // Note: Testing debouncing with FakeAsync is usually better but requires additional setup.
    // Here we test if it eventually calls the useCase.
    blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      'eventually emits success after debounce duration',
      build: () {
        when(() => mockUseCase()).thenAnswer((_) async => const Right(t{{entity_name.pascalCase()}}s));
        return cubit;
      },
      act: (cubit) => cubit.fetchInitialDebounced(duration: Duration.zero),
      wait: const Duration(milliseconds: 10),
      expect: () => [
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success, data: t{{entity_name.pascalCase()}}s),
      ],
    );
  });
}
