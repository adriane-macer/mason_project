import 'package:core_package/src/di/injector.dart';

import 'package:core_package/src/di/injector.dart';

import 'package:core_package/src/di/injector.dart';

import 'package:core_package/src/di/injector.dart';
import 'package:dio/dio.dart';

Future<void> registerCore() async {
  sl.registerLazySingleton<Logger>(
    Logger.new,
  );

  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: FlavorConfig.env.baseUrl,
      ),
    ),
  );

  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      sl<Dio>(),
    ),
  );
}
