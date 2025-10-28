import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/app/config/service_locator.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/custom_exception.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/utility_helper.dart';
import 'package:{{project_name.snakeCase()}}/core/services/storages/cached_timers/i_cached_timer_handler.dart';
import 'package:{{project_name.snakeCase()}}/core/services/storages/hive/hive_service_handler.dart';

import '../{{name.snakeCase()}}_barrel.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit(this._repository)
        : super({{name.pascalCase()}}Initial());
    final I{{name.pascalCase()}}Repository _repository;


  List<{{return_class.pascalCase()}}Model> list = [];

  Future<void> initialize() async {
    await Future.delayed(const Duration(milliseconds: 1));

    emit({{name.pascalCase()}}Loading());

    list = await _getLocal();

    emit({{name.pascalCase()}}Success(list));

    try {
      final cachedTimer =
      getIt<ICachedTimerHandler>().{{return_class.camelCase()}}CachedTimer.readTimer();

      DateTime? cachedTime = DateTime.tryParse(cachedTimer ?? "");
      final expired =
      await UtilityHelper.cacheExpired(dateTime: cachedTime, duration: 3);

      if (expired) {
        emit({{name.pascalCase()}}Loading());
        final result = await _fetchData();

        if (result.isNotEmpty) {
          list = result;
        }

        await _save(result);
        getIt<ICachedTimerHandler>()
            .{{return_class.camelCase()}}CachedTimer
            .writeTimer(date: DateTime.now().toString());

        emit({{name.pascalCase()}}Success(result));
      }
    } catch (e) {
      if(isClosed){
        return;
      }
      if (e is CustomException) {
        emit( {{name.pascalCase()}}Failed(e));
      } else {
        emit(
        {{name.pascalCase()}}Failed(CustomException("Something went wrong")));
      }
    }
  }

  Future<List<{{return_class.pascalCase()}}Model>> _fetchData() async {
    try {
      final result = await _repository.getList();
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    await Future.delayed(const Duration(milliseconds: 1));

    emit({{name.pascalCase()}}Loading());
    try {
      final result = await _fetchData();
      if (result.isNotEmpty) {
      list = result;
    }

    await _save(list);

    emit({{name.pascalCase()}}Success(result));
    } catch (e) {
      if (e is CustomException) {
      emit({{name.pascalCase()}}Failed(e));
    } else {
      emit(
        {{name.pascalCase()}}Failed(CustomException("Something went wrong")));
      }
    }
  }

  Future<List<{{return_class.pascalCase()}}Model>> _getLocal() async {
    final db = getIt<HiveServiceHandler>().{{return_class.camelCase()}}HiveService;
    final result = await db.getList();
    return result;
  }

  Future<void> _save(List<{{return_class.pascalCase()}}Model> list) async {
    final db = getIt<HiveServiceHandler>().{{return_class.camelCase()}}HiveService;
    await db.updateList(list: list);
  }
}

