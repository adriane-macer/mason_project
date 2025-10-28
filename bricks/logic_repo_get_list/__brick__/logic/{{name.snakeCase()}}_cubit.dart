import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/custom_exception.dart';

import '../{{name.snakeCase()}}_barrel.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._repository)
      : super({{name.pascalCase()}}Initial());
  final I{{name.pascalCase()}}Repository _repository;

  List<{{return_class.pascalCase()}}> list = <{{return_class.pascalCase()}}>[];
  final int _limit = 120;
  int? cursor;
  bool loading = false;

  Future<void> initialize() async {
    emit({{name.pascalCase()}}Loading());
    if (loading) {
    return;
    }
    list = [];
    cursor = null;
    loading = true;

    final savedData = await _getSavedData();
    list = savedData;
    loading = false;
    emit({{name.pascalCase()}}Success((savedData, cursor)));

    final cachedTimer = (getIt<ICachedTimerHandler>()
        .{{return_class.camelCase()}}CachedTimer as {{return_class.pascalCase()}}CachedTimer);
    {{return_class.camelCase()}}CachedTimer.addKeySuffix(playlistId: section);

    final cachedTimer = {{return_class.camelCase()}}CachedTimer.readTimer();

    DateTime? cachedTime = DateTime.tryParse(cachedTimer ?? "");
    final expired =
    await UtilityHelper.cacheExpired(dateTime: cachedTime, duration: 6);

    if (expired) {
    await refresh();
    }
  }

  Future<List<{{return_class.pascalCase()}}Model>> _getSavedData() async {
    final db = getIt<HiveServiceHandler>().{{return_class.camelCase()}}HiveService;

    final result = await db.getList();
    return result;
  }

  Future<void> refresh() async {
    list = [];
    cursor = null;
    loading = true;
    emit({{name.pascalCase()}}Loading());
    await Future.delayed(const Duration(microseconds: 1));
    try {
    final result = await repository.getList(
    limit: _limit, cursor: cursor);
    list = result.$1;
    cursor = result.$2;
    loading = false;
    await _saveData(data: (list, section));
    emit({{name.pascalCase()}}Success(result));
    } catch (e) {
    debugPrint("{{name.pascalCase()}}Cubit.refresh : $e");
    loading = false;
    if (e is Exception) {
    emit({{name.pascalCase()}}Failed(e));
    } else {
    emit({{name.pascalCase()}}Failed(Exception("Something went wrong")));
    }
    }
  }

  Future<void> loadMore() async {
    if (loading) {
    return;
    }
    if (cursor == null) {
    return;
    }
    loading = true;
    emit({{name.pascalCase()}}Loading());
    try {
    final result = await repository.getList(
    limit: _limit, cursor: cursor);
    list.addAll(result.$1);
    cursor = result.$2;

    await _saveData(data: (list, section));

    loading = false;
    emit({{name.pascalCase()}}Success(result));
    } catch (e) {
    debugPrint("{{name.pascalCase()}}Cubit.refresh : $e");
    loading = false;
    if (e is Exception) {
    emit({{name.pascalCase()}}Failed(e));
    } else {
    emit({{name.pascalCase()}}Failed(Exception("Something went wrong")));
    }
    }
  }

  Future<void> _saveData({required (List<{{return_class.pascalCase()}}>, String?) data}) async {
    final db = getIt<HiveServiceHandler>().{{return_class.camelCase()}}HiveService;
    await db.updateList(list: data.$1);

    final {{return_class.pascalCase()}}CachedTimer = (getIt<ICachedTimerHandler>()
        .{{return_class.camelCase()}}CachedTimer as {{return_class.pascalCase()}}CachedTimer);

    {{return_class.camelCase()}}CachedTimer.writeTimer(date: DateTime.now().toString());
  }
}

