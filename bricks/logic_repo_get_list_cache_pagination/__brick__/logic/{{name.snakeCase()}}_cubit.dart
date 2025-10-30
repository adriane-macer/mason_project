import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:{{project_name.snakeCase()}}/app/config/service_locator.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/custom_exception.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/utility_helper.dart';
import 'package:{{project_name.snakeCase()}}/core/services/storages/cached_timers/i_cached_timer_handler.dart';
import 'package:{{project_name.snakeCase()}}/core/services/storages/hive/hive_service_handler.dart';

import '../get_{{return_class.snakeCase()}}_barrel.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._repository)
      : super({{name.pascalCase()}}Initial());
  final I{{name.pascalCase()}}Repository _repository;
  final int _limit = 20;

  List<{{return_class.pascalCase()}}Model> list = [];
  String? cursor;
  bool loading = false;
  bool cachedOnly = true;

  Future<void> initialize() async {
    await Future.delayed(const Duration(milliseconds: 1));

    emit({{name.pascalCase()}}Loading());

    list = await _getLocal();
    emit({{name.pascalCase()}}Success(list));

    try {
      final cachedTimer = getIt<ICachedTimerHandler>().{{return_class.snakeCase()}}CachedTimer
          .readTimer();

      DateTime? cachedTime = DateTime.tryParse(cachedTimer ?? "");
      final expired = await UtilityHelper.cacheExpired(
        dateTime: cachedTime,
        duration: 3,
      );
      if (expired) {
        emit({{name.pascalCase()}}Loading());
        final result = await _fetchData();
        list = result.$1;
        cursor = result.$2;

        await _save(list);
        getIt<ICachedTimerHandler>().{{return_class.snakeCase()}}CachedTimer.writeTimer(
          date: DateTime.now().toString(),
        );
        debugPrint("{{name.pascalCase()}}Cubit.initialize : getIt<ICachedTimerHandler>().{{return_class.snakeCase()}}CachedTimer ${getIt<ICachedTimerHandler>().{{return_class.snakeCase()}}CachedTimer.readTimer()}");
        emit({{name.pascalCase()}}Success(list));
      }
    } catch (e) {
      if (isClosed) {
        return;
      }
      if (e is CustomException) {
        emit({{name.pascalCase()}}Failed(e));
      } else {
        emit({{name.pascalCase()}}Failed(CustomException("Something went wrong")));
      }
    }
  }

  Future<(List<{{return_class.pascalCase()}}Model>, String?)> _fetchData() async {
    try {
      final result = await _repository.getList(cursor: null);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    await Future.delayed(const Duration(milliseconds: 1));

    list = [];
    cursor = null;
    cachedOnly = false;

    emit({{name.pascalCase()}}Loading());
    try {
      final result = await _fetchData();

      list = result.$1;
      cursor = result.$2;

      await _save(list);

      emit({{name.pascalCase()}}Success(list));
    } catch (e) {
      if (e is CustomException) {
        emit({{name.pascalCase()}}Failed(e));
      } else {
        emit({{name.pascalCase()}}Failed(CustomException("Something went wrong")));
      }
    }
  }

  Future<void> loadMore() async {
    if (loading) {
      return;
    }
    if (cursor == null && !cachedOnly) {
      return;
    }

    loading = true;
    emit({{name.pascalCase()}}Loading());
    try {
      final result = await _repository.getList(
        limit: _limit,
        cursor: cursor,
      );

      if(cachedOnly){
        cachedOnly = false;
        list.clear();
      }
      list.addAll(result.$1);
      cursor = result.$2;

      await _save(list);

      loading = false;
      emit({{name.pascalCase()}}Success(list));
    } catch (e) {
      debugPrint("{{name.pascalCase()}}Cubit.refresh : $e");
      loading = false;
      if (e is Exception) {
        emit({{name.pascalCase()}}Failed(CustomException(e.toString())));
      } else {
        emit({{name.pascalCase()}}Failed(CustomException("Something went wrong")));
      }
    }
  }

  Future<List<{{return_class.pascalCase()}}Model>> _getLocal() async {
    final db = getIt<HiveServiceHandler>().{{return_class.snakeCase()}}HiveService;
    final result = await db.getList();
    return result;
  }

  Future<void> _save(List<{{return_class.pascalCase()}}Model> list) async {
    final db = getIt<HiveServiceHandler>().{{return_class.snakeCase()}}HiveService;
    await db.updateList(list: list);
  }
}

