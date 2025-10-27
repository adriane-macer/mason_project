import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/custom_exception.dart';

import '../{{name.snakeCase()}}_barrel.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._repository)
      : super({{name.pascalCase()}}Initial());
  final I{{name.pascalCase()}}Repository _repository;

  Future<void> {{method_name.camelCase()}}() async {
    emit({{name.pascalCase()}}Loading());

    try {
      final result = await _repository.{{method_name.camelCase()}}();
      emit({{name.pascalCase()}}Success(result));
    } on CustomException catch (e) {
      emit({{name.pascalCase()}}Failed(e));
    } catch (e) {
      emit(
      {{name.pascalCase()}}Failed(CustomException( e.toString())));
    }
  }


bool loading = false;
static const int _limit = 10;
String? cursor;
List<{{return_class.pascalCase()}}> list = [];

  Future<void> initialize() async {
  await Future.delayed(const Duration(milliseconds: 1));
  loading = true;
  emit({{name.pascalCase()}}Loading());
  try {
    final result =
    await _repository.{{method_name.camelCase()}}(limit: _limit);
    if (result.isNotEmpty) {
        list.addAll(result);
      }
        emit({{name.pascalCase()}}Success(result));
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
      offset: list.length, limit: _limit);
      if (result.isNotEmpty) {
        list.addAll(result);
      }
      emit({{name.pascalCase()}}Success(result));
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

