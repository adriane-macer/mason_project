import 'package:authentication/authentication.dart';
import 'package:core_package/core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

/// Service Locator instance.
final GetIt sl = GetIt.instance;

/// Sets up the dependency injection for the application.
Future<void> setupDependencyInjection() async {
  // Register Config
  final appConfig = sl<AppConfig>();
  final baseUrl = appConfig.baseUrl;

  // Register Storage
  sl.registerLazySingleton<LocalStorage>(
    () => const SecureStorageImpl(FlutterSecureStorage()),
  );

  final localDatabase = IsarDatabaseImpl();
  await localDatabase.init();
  sl.registerLazySingleton<LocalDatabase>(() => localDatabase);

  // Register Network
  sl.registerLazySingleton<DioClient>(
    () => DioClient.create(baseUrl: baseUrl, localStorage: sl<LocalStorage>()),
  );
}
