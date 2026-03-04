import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class Mock{{feature_name.pascalCase()}}RemoteDataSource extends Mock implements {{feature_name.pascalCase()}}RemoteDataSource {}
class Mock{{feature_name.pascalCase()}}LocalDataSource extends Mock implements {{feature_name.pascalCase()}}LocalDataSource {}

void main() {
  late Mock{{feature_name.pascalCase()}}RemoteDataSource remote;
  late Mock{{feature_name.pascalCase()}}LocalDataSource local;
  late {{feature_name.pascalCase()}}RepositoryImpl repository;

  setUp(() {
    remote = Mock{{feature_name.pascalCase()}}RemoteDataSource();
    local = Mock{{feature_name.pascalCase()}}LocalDataSource();
    repository = {{feature_name.pascalCase()}}RepositoryImpl(remote, local);
  });

  test('should return cached data then remote data when both are available', () async {
    const tCachedData = {{return_type.pascalCase()}}Model();
    const tRemoteData = {{return_type.pascalCase()}}Model();
    when(() => local.get()).thenAnswer((_) async => tCachedData);
    when(() => remote.{{method_name}}()).thenAnswer((_) async => tRemoteData);
    when(() => local.save(any())).thenAnswer((_) async => {});

    final result = repository.{{method_name}}();

    expect(
      result,
      emitsInOrder([
        right(tCachedData),
        right(tRemoteData),
      ]),
    );
    verify(() => local.get());
    verify(() => remote.{{method_name}}());
    verify(() => local.save(tRemoteData));
  });

  test('should fetch from remote and save to local when cache is empty', () async {
    const tData = {{return_type.pascalCase()}}Model();
    when(() => local.get()).thenAnswer((_) async => null);
    when(() => remote.{{method_name}}()).thenAnswer((_) async => tData);
    when(() => local.save(any())).thenAnswer((_) async => {});

    final result = repository.{{method_name}}();

    expect(
      result,
      emitsInOrder([
        right(tData),
      ]),
    );
    verify(() => local.get());
    verify(() => remote.{{method_name}}());
    verify(() => local.save(tData));
  });

  test('should return failure when remote fetch fails and cache is empty', () async {
    when(() => local.get()).thenAnswer((_) async => null);
    when(() => remote.{{method_name}}()).thenThrow(DioException(
      requestOptions: RequestOptions(path: ''),
      type: DioExceptionType.connectionTimeout,
    ));

    final result = repository.{{method_name}}();

    await expectLater(
      result,
      emitsInOrder([
        predicate((Either<Failure, {{return_type.pascalCase()}}Entity> r) => r.isLeft()),
      ]),
    );
  });
  });
}
