import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}Api extends Mock implements {{feature_name.pascalCase()}}Api {}

void main() {
  late Mock{{feature_name.pascalCase()}}Api mockApi;
  late {{feature_name.pascalCase()}}RemoteDataSourceImpl dataSource;

  setUp(() {
    mockApi = Mock{{feature_name.pascalCase()}}Api();
    dataSource = {{feature_name.pascalCase()}}RemoteDataSourceImpl(mockApi);
    registerFallbackValue({{feature_name.pascalCase()}}RequestParams(''));
  });

  const t{{entity_name.pascalCase()}}Models = [{{entity_name.pascalCase()}}Model(id: 1)];
  const t{{entity_name.pascalCase()}}s = [{{entity_name.pascalCase()}}(id: 1)];
  final tRequestParams = {{feature_name.pascalCase()}}RequestParams('');

  group('fetch', () {
    test('should return Right(List<{{entity_name.pascalCase()}}>) when API call is successful', () async {
      when(() => mockApi.fetch(any())).thenAnswer((_) async => t{{entity_name.pascalCase()}}Models);

      final result = await dataSource.fetch(tRequestParams);

      expect(result.isRight(), true);
      expect(result.getOrElse(() => []), t{{entity_name.pascalCase()}}s);
      verify(() => mockApi.fetch(tRequestParams)).called(1);
    });

    test('should return Left(Failure) when API call throws DioException', () async {
      final tDioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.badResponse,
      );
      when(() => mockApi.fetch(any())).thenThrow(tDioException);

      final result = await dataSource.fetch(tRequestParams);

      expect(result.isLeft(), true);
      verify(() => mockApi.fetch(tRequestParams)).called(1);
    });

    test('should return Left(UnknownFailure) when API call throws unknown exception', () async {
      when(() => mockApi.fetch(any())).thenThrow(Exception());

      final result = await dataSource.fetch(tRequestParams);

      expect(result, const Left(UnknownFailure()));
      verify(() => mockApi.fetch(tRequestParams)).called(1);
    });
  });
}
