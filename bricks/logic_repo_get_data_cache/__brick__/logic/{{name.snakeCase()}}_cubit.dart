import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/custom_exception.dart';
import 'package:hiraya/app/config/service_locator.dart';

import '../{{name.snakeCase()}}_barrel.dart';
import 'package:{{project_name.snakeCase()}}/core/services/storages/cached_timers/i_cached_timer_handler.dart';
import 'package:{{project_name.snakeCase()}}/core/services/storages/hive/hive_service_handler.dart';
import 'package:{{project_name.snakeCase()}}/core/utils/utility_helper.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._repository)
      : super({{name.pascalCase()}}Initial());
  final I{{name.pascalCase()}}Repository _repository;
  {{return_class.pascalCase()}}Model? data;

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


Future<void> fetchData() async {
emit({{name.pascalCase()}}Loading());
try {
final result = await _repository.{{name.camelCase()}}();
data = result!;
try {
final db = getIt<HiveServiceHandler>().{{return_class.camelCase()}}HiveService;
await db.saveData(data: result);

getIt<ICachedTimerHandler>()
    .{{return_class.camelCase()}}CachedTimer
    .writeTimer(date: DateTime.now().toString());

if (isClosed) {
return;
}
emit({{name.pascalCase()}}Successful(data!));
} catch (e) {
debugPrint("{{name.pascalCase()}}Cubit.fetchData: on saving $e");
if (isClosed) {
return;
}
emit({{name.pascalCase()}}Failed(Exception(e.toString())));
}
} on UnauthorizedException {
if (isClosed) {
return;
}
emit({{name.pascalCase()}}Unauthenticated());
} catch (e) {
if (e is Exception) {
if (isClosed) {
return;
}
emit({{name.pascalCase()}}Failed(e));
} else {
if (isClosed) {
return;
}
emit({{name.pascalCase()}}Failed(Exception(e.toString())));
}
}
}

Future<void> initialize() async {
emit({{name.pascalCase()}}Loading());

await _getSavedData();
final cachedTimer =
getIt<ICachedTimerHandler>().{{return_class.camelCase()}}CachedTimer.readTimer();

DateTime? cachedTime = DateTime.tryParse(cachedTimer ?? "");
final expired =
await UtilityHelper.cacheExpired(dateTime: cachedTime, duration: 6);

if (expired) {
await fetchData();
} else {
if (data != null) {
emit({{name.pascalCase()}}Successful(data!));
} else {
emit({{name.pascalCase()}}Failed(Exception("No data")));
}
}
}

Future<void> _getSavedData() async {
try {
final db = getIt<HiveServiceHandler>().{{return_class.camelCase().replaceAll("Model", "")}}HiveService;
final result = await db.getData();
data = result;
emit({{name.pascalCase()}}FetchSuccessful(data!));
} catch (e) {
debugPrint("{{name.pascalCase()}}Cubit._getSavedData : $e");
}
}
}

