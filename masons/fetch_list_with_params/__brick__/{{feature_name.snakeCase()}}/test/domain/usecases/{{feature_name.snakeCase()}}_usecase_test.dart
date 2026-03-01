import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
class Mock{{feature_name.pascalCase()}}Repository extends Mock implements {{feature_name.pascalCase()}}Repository {}

void main() {
  late Mock{{feature_name.pascalCase()}}Repository mockRepository;
  late {{feature_name.pascalCase()}}UseCase useCase;

  setUp(() {
    mockRepository = Mock{{feature_name.pascalCase()}}Repository();
    useCase = {{feature_name.pascalCase()}}UseCase(mockRepository);
  });

  const t{{entity_name.pascalCase()}}s = [{{entity_name.pascalCase()}}(id: 1)];

  test('should get products from the repository', () async {
    when(() => mockRepository.fetch()).thenAnswer((_) async => const Right<Failure, List<{{entity_name.pascalCase()}}>>(t{{entity_name.pascalCase()}}s));

    final result = await useCase();

    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), t{{entity_name.pascalCase()}}s);
    verify(() => mockRepository.fetch()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return failure from the repository', () async {
    const tFailure = ServerFailure();
    when(() => mockRepository.fetch()).thenAnswer((_) async => const Left(tFailure));

    final result = await useCase();

    expect(result, const Left(tFailure));
    verify(() => mockRepository.fetch()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
