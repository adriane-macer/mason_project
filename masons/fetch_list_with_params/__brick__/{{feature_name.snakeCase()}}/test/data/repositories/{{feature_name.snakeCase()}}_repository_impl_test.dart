import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}RemoteDataSource extends Mock implements {{feature_name.pascalCase()}}RemoteDataSource {}

void main() {
  late Mock{{feature_name.pascalCase()}}RemoteDataSource mockRemoteDataSource;
  late {{feature_name.pascalCase()}}RepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = Mock{{feature_name.pascalCase()}}RemoteDataSource();
    repository = {{feature_name.pascalCase()}}RepositoryImpl(mockRemoteDataSource);
    registerFallbackValue({{feature_name.pascalCase()}}RequestParams(''));
  });

  const t{{entity_name.pascalCase()}}s = [{{entity_name.pascalCase()}}(id: 1)];
  final tRequestParams = {{feature_name.pascalCase()}}RequestParams('');

  group('fetch', () {
    test('should return data when call to remote data source is successful', () async {
      when(() => mockRemoteDataSource.fetch(any())).thenAnswer((_) async => const Right<Failure, List<{{entity_name.pascalCase()}}>>(t{{entity_name.pascalCase()}}s));

      final result = await repository.fetch(tRequestParams);

      expect(result.isRight(), true);
      expect(result.getOrElse(() => []), t{{entity_name.pascalCase()}}s);
      verify(() => mockRemoteDataSource.fetch(tRequestParams)).called(1);
    });

    test('should return failure when call to remote data source is unsuccessful', () async {
      const tFailure = ServerFailure();
      when(() => mockRemoteDataSource.fetch(any())).thenAnswer((_) async => const Left(tFailure));

      final result = await repository.fetch(tRequestParams);

      expect(result, const Left(tFailure));
      verify(() => mockRemoteDataSource.fetch(tRequestParams)).called(1);
    });
  });
}
