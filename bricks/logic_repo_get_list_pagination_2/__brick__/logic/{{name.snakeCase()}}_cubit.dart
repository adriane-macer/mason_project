import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/custom_exception.dart';

import '../{{name.snakeCase()}}_barrel.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._repository)
      : super({{name.pascalCase()}}Initial());
  final I{{name.pascalCase()}}Repository _repository;


  List<{{return_class.pascalCase()}}> medias = <{{return_class.pascalCase()}}>[];
  final int _limit = 10;
  String? cursor;
  bool loading = false;
  List<{{return_class.pascalCase()}}> list = [];

  Future<void> initialize() async {
  await Future.delayed(const Duration(milliseconds: 1));
  loading = true;
  emit({{name.pascalCase()}}Loading());
  try {
    final result =
    await _repository.{{method_name.camelCase()}}(limit: _limit, cursor: cursor);
    if (result.$1.isNotEmpty) {
        list.addAll(result.$1);
      }
        emit({{name.pascalCase()}}Success(result.$1));
    } catch (e) {
      if (e is CustomException) {
        emit({{name.pascalCase()}}Failed(e));
      } else {
        emit({{name.pascalCase()}}Failed(CustomException("Something went wrong")));
      }
    } finally {
      loading = false;
    }
  }

  Future<void> loadMore() async {
    if (loading) {
      return;
    }
    loading = true;
    emit({{name.pascalCase()}}Loading());
    try {
      final result = await _repository.{{method_name.camelCase()}}(
      limit: _limit, cursor: cursor);
      if (result.$1.isNotEmpty) {
        list.addAll(result.$1);
        cursor = result.$2;
      }
      emit({{name.pascalCase()}}Success(result.$1));
    } catch (e) {
      if (e is CustomException) {
        emit({{name.pascalCase()}}Failed(e));
      } else {
        emit({{name.pascalCase()}}Failed(CustomException("Something went wrong")));
      }
    } finally {
      loading = false;
    }
  }
}

