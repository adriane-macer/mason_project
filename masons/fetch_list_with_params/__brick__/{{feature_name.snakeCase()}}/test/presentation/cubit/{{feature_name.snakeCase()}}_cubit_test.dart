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
    registerFallbackValue(const {{feature_name.pascalCase()}}Params(''));
  });

  tearDown(() {
    cubit.close();
  });

  const t{{feature_name.pascalCase()}}s = [{{feature_name.pascalCase()}}(id: 1)];

  test('initial state should be {{feature_name.pascalCase()}}State.initial()', () {
    expect(cubit.state, const {{feature_name.pascalCase()}}State.initial());
  });

  group('fetchInitial', () {
    blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      'emits [loading, success] when useCase returns data',
      build: () {
        when(() => mockUseCase(any())).thenAnswer((_) async => const Right(t{{feature_name.pascalCase()}}s));
        return cubit;
      },
      act: (cubit) => cubit.fetchInitial(path: ''),
      expect: () => [
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success, data: t{{feature_name.pascalCase()}}s),
      ],
      verify: (_) {
        verify(() => mockUseCase(any())).called(1);
      },
    );

    blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      'emits [loading, failure] when useCase returns failure',
      build: () {
        when(() => mockUseCase(any())).thenAnswer((_) async => const Left(ServerFailure()));
        return cubit;
      },
      act: (cubit) => cubit.fetchInitial(path: ''),
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
        when(() => mockUseCase(any())).thenAnswer((_) async => const Right(t{{feature_name.pascalCase()}}s));
        return cubit;
      },
      act: (cubit) => cubit.refresh(path: ''),
      expect: () => [
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.refreshing),
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success, data: t{{feature_name.pascalCase()}}s),
      ],
    );
  });

  group('fetchInitialDebounced', () {
    blocTest<{{feature_name.pascalCase()}}Cubit, {{feature_name.pascalCase()}}State>(
      'eventually emits success after debounce duration',
      build: () {
        when(() => mockUseCase(any())).thenAnswer((_) async => const Right(t{{feature_name.pascalCase()}}s));
        return cubit;
      },
      act: (cubit) => cubit.fetchInitialDebounced(path: '', duration: Duration.zero),
      wait: const Duration(milliseconds: 10),
      expect: () => [
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.loading),
        const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.success, data: t{{feature_name.pascalCase()}}s),
      ],
    );
  });
}
