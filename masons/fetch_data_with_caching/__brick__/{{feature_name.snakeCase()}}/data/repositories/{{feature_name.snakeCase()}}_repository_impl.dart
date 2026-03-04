import 'package:rxdart/rxdart.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  final {{feature_name.pascalCase()}}RemoteDataSource remote;
  final {{feature_name.pascalCase()}}LocalDataSource local;
  final Duration ttl;

  final BehaviorSubject<Either<Failure, {{return_type.pascalCase()}}Entity>> _subject = 
      BehaviorSubject<Either<Failure, {{return_type.pascalCase()}}Entity>>();

  {{feature_name.pascalCase()}}RepositoryImpl(this.remote, this.local, {this.ttl = const Duration(minutes: 2)});

  @override
  Stream<Either<Failure, {{return_type.pascalCase()}}Entity>> {{method_name}}() {
    _fetch();
    return _subject.stream;
  }

  Future<void> _fetch() async {
    try {
      final cachedData = await local.get();
      if (cachedData != null) {
        _subject.add(right(cachedData));
      }
      
      final response = await remote.{{method_name}}();
      await local.save(response);
      _subject.add(right(response));
    } on DioException catch (e) {
      if (!_subject.hasValue || _subject.value.isLeft()) {
         _subject.add(left(mapDioException(e)));
      }
    } catch (e) {
      if (!_subject.hasValue || _subject.value.isLeft()) {
        _subject.add(left(ServerFailure(message: e.toString())));
      }
    }
  }

  void dispose() {
    _subject.close();
  }
}
