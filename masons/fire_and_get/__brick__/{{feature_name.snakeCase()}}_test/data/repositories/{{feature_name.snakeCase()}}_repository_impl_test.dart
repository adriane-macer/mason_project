import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class Mock{{feature_name.pascalCase()}}RemoteDataSource<T>  extends Mock implements {{feature_name.pascalCase()}}RemoteDataSource<T>  {}


void main(){
  late Mock{{feature_name.pascalCase()}}RemoteDataSource<T>  remote;
  late {{feature_name.pascalCase()}}RepositoryImpl<T>  repository;

  setUp(() {
    remote = Mock{{feature_name.pascalCase()}}RemoteDataSource<T> ();
    repository = {{feature_name.pascalCase()}}RepositoryImpl<T> (remote);

  });

test('returns unit when API succeeds', () async {
when(() => remote.{{method_name.camelCase}}())
    .thenAnswer((_) async {});

final result = await repository.{{method_name.camelCase}}();

expect(result, right(unit));
});

  test('returns failure when DioException occurs', () async {
    when(() => remote.{{method_name.camelCase}}())
        .thenThrow(DioException(
    requestOptions: RequestOptions(path: ''),
    type: DioExceptionType.connectionTimeout,
    ));

    final result = await repository.{{method_name.camelCase}}();

    expect(result.isLeft(), true);
  });

}