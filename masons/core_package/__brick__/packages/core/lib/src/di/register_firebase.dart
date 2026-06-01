import 'package:core_package/src/di/injector.dart';

import 'package:core_package/src/di/injector.dart';

import 'package:core_package/src/di/injector.dart';

import 'package:core_package/src/di/injector.dart';

import 'package:core_package/src/di/injector.dart';

Future<void> registerFirebaseModules() async {
  if (FlavorConfig.isDemo) {
    return;
  }

  sl.registerLazySingleton<FirebaseCoreService>(
    FirebaseCoreServiceImpl.new,
  );

  sl.registerLazySingleton<AuthProvider>(
    () => FirebaseAuthProvider(
      FirebaseAuth.instance,
    ),
  );

  sl.registerLazySingleton<AnalyticsService>(
    () => FirebaseAnalyticsService(
      FirebaseAnalytics.instance,
    ),
  );

  sl.registerLazySingleton<CrashReportingService>(
    FirebaseCrashlyticsService.new,
  );

  sl.registerLazySingleton<PushNotificationService>(
    FirebaseMessagingServiceImpl.new,
  );
}
