import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio dio;
  late Dio{{feature_name.pascalCase()}}tRemoteDataSource dataSource;

  setUp(() {
    dio = MockDio();
    dataSource = Dio{{feature_name.pascalCase()}}tRemoteDataSource(dio);
  });

  test('parses response data correctly', () async {
    when(
      () => dio.get(any()),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
          path: '',
        ),
        data: {
          'data': [
            {
              'id': 1,
            },
          ],
          'total': 1,
        },
      ),
    );

    final result = await dataSource.fetch(offset: 0, limit: 20);

    expect(result.length, 1);
  });

  test('rethrows DioException from dio client', () async {
    final exception = DioException(
      requestOptions: RequestOptions(
        path: '',
      ),
      type: DioExceptionType.connectionTimeout,
    );

    when(
      () => dio.get(any(), ),
    ).thenThrow(exception);

    expect(
      () => dataSource.fetch(offset: 0, limit: 20),
      throwsA(same(exception)),
    );
  });
}
