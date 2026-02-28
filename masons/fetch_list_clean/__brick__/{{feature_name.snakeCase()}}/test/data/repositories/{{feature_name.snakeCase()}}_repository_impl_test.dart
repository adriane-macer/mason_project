import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}RemoteDataSource extends Mock
    implements {{feature_name.pascalCase()}}RemoteDataSource {}

void main() {
  late Mock{{feature_name.pascalCase()}}RemoteDataSource remoteDataSource;
  late {{feature_name.pascalCase()}}RepositoryImpl repository;

  setUp(() {
    remoteDataSource = Mock{{feature_name.pascalCase()}}RemoteDataSource();
    repository = {{feature_name.pascalCase()}}RepositoryImpl(remoteDataSource);
  });

  test('returns mapped entities on success', () async {
    when(() => remoteDataSource.fetch(offset: 0, limit: 20)).thenAnswer(
      (_) async => PaginationResult< {{entity_name.pascalCase()}}>(
        items: const [
          {{entity_name.pascalCase()}}(
            id: 1
          ),
        ],
        totalCount: 1,
        hasMore: false,
      ),
    );

    final result = await repository.fetch(offset: 0, limit: 20);

    expect(result.isRight(), true);
    result.fold((_) => fail('Expected success'), (data) {
      expect(data.items, const [
        InterestMedalListEntity(
          id: 1,
          interest: 'Sports',
          interestCategoryId: 2,
          interestCategoryName: 'Games',
        ),
      ]);
      expect(data.totalCount, 1);
      expect(data.hasMore, false);
    });
  });

  test('maps DioException to Failure', () async {
    when(() => remoteDataSource.fetch(offset: 0, limit: 20)).thenThrow(
      DioException(
        requestOptions: RequestOptions(
          path: '/gold-rush/treasures/medal-interests/find',
        ),
        response: Response(
          requestOptions: RequestOptions(
            path: '/gold-rush/treasures/medal-interests/find',
          ),
          statusCode: 401,
        ),
        type: DioExceptionType.badResponse,
      ),
    );

    final result = await repository.fetch(offset: 0, limit: 20);

    expect(result.isLeft(), true);
    result.fold((failure) {
      expect(failure, isA<UnauthorizedFailure>());
    }, (_) => fail('Expected failure'));
  });
}
