import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

void main(){

  test('returns failure when DioException occurs', () async {
    when(() => remote.{{method_name}}())
        .thenThrow(DioException(
    requestOptions: RequestOptions(path: ''),
    type: DioExceptionType.connectionTimeout,
    ));

    final result = await repository.{{method_name}}();

    expect(result.isLeft(), true);
  });
}