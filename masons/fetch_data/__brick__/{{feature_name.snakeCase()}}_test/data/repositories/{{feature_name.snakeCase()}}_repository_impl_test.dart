import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class Mock{{feature_name.pascalCase()}}RemoteDataSource extends Mock implements {{feature_name.pascalCase()}}RemoteDataSource {}

void main() {
  late Mock{{feature_name.pascalCase()}}RemoteDataSource remote;
  late {{feature_name.pascalCase()}}RepositoryImpl repository;

  setUp(() {
    remote = Mock{{feature_name.pascalCase()}}RemoteDataSource();
    repository = {{feature_name.pascalCase()}}RepositoryImpl(remote);
  });

  test('should return remote data when fetch is successful', () async {
    const tRemoteData = {{return_type.pascalCase()}}Model();
    when(() => remote.{{method_name}}()).thenAnswer((_) async => tRemoteData);

    final result = await repository.{{method_name.camelCase()}}();

    expect(result, right(tRemoteData));
    verify(() => remote.{{method_name.camelCase()}}());
  });

  test('should return failure when remote fetch fails', () async {
    when(() => remote.{{method_name.camelCase()}}()).thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      type: DioExceptionType.connectionTimeout,
    ));

    final result = await repository.{{method_name.camelCase()}}();

    expect(result.isLeft(), true);
  });
}
