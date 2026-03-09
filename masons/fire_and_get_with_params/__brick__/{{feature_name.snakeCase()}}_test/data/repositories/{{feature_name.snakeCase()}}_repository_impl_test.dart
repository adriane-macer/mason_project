import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class Mock{{feature_name.pascalCase()}}RemoteDataSource<T>  extends Mock implements {{feature_name.pascalCase()}}RemoteDataSource<T>  {}
class Mock{{params_type.pascalCase()}} extends Mock implements {{params_type.pascalCase()}} {}

void main(){
  late Mock{{feature_name.pascalCase()}}RemoteDataSource<T>  remote;
  late {{feature_name.pascalCase()}}RepositoryImpl<T>  repository;
  late Mock{{params_type.pascalCase()}} params;

  setUp(() {
    remote = Mock{{feature_name.pascalCase()}}RemoteDataSource<T> ();
    repository = {{feature_name.pascalCase()}}RepositoryImpl<T> (remote);
    params = Mock{{params_type.pascalCase()}}();
  });

test('returns unit when API succeeds', () async {
when(() => remote.{{method_name.camelCase()}}(params))
    .thenAnswer((_) async {});

final result = await repository.{{method_name.camelCase()}}(params);

expect(result, right(unit));
});

  test('returns failure when DioException occurs', () async {
    when(() => remote.{{method_name.camelCase()}}(params))
        .thenThrow(DioException(
    requestOptions: RequestOptions(path: ''),
    type: DioExceptionType.connectionTimeout,
    ));

    final result = await repository.{{method_name.camelCase()}}(params);

    expect(result.isLeft(), true);
  });

}
