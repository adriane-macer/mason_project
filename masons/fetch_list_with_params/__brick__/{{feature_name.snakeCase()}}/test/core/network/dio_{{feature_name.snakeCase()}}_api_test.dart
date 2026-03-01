import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('Dio{{feature_name.pascalCase()}}Api', () {
    late MockDio dio;
    late Dio{{feature_name.pascalCase()}}Api api;

    setUp(() {
      dio = MockDio();
      api = Dio{{feature_name.pascalCase()}}Api(dio);
    });

    test('parses response data into interest models', () async {
      when(
            () => dio.get(any()),
      ).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {
            'data': [
              {'id': 1},
              {'id': 2},
              {'id': 3},
            ],
          },
        ),
      );

      final result = await api.fetch({{feature_name.pascalCase()}}RequestParams(''));

      expect(result, hasLength(3));
      expect(result.map((interest) => interest.id), [1, 2, 3]);
      verify(() => dio.get(any())).called(1);
    });

    test('returns empty list when data is null', () async {
      when(
            () => dio.get(any()),
      ).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'data': null},
        ),
      );

      final result = await api.fetch({{feature_name.pascalCase()}}RequestParams(''));

      expect(result, isEmpty);
      verify(() => dio.get(any())).called(1);
    });

    test('rethrows exceptions from dio client', () async {
      final exception = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionTimeout,
      );

      when(() => dio.get(any())).thenThrow(exception);

      expect(() => api.fetch({{feature_name.pascalCase()}}RequestParams('')), throwsA(same(exception)));
      verify(() => dio.get(any())).called(1);
    });
  });
}
