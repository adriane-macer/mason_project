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

    test('parses response data into {{entity_name.camelCase()}} models', () async {
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

      final result = await api.fetch();

      expect(result, hasLength(3));
      expect(result.map(({{entity_name.camelCase()}}) => {{entity_name.camelCase()}}.id), [1, 2, 3]);
      verify(() => dio.get(any())).called(1);
    });

    test('rethrows exceptions from dio client', () async {
      final exception = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionTimeout,
      );

      when(() => dio.get(any())).thenThrow(exception);

      expect(() => api.fetch(), throwsA(same(exception)));
      verify(() => dio.get(any())).called(1);
    });
  });
}
