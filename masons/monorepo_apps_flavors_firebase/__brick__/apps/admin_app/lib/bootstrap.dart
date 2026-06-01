import 'package:flutter/material.dart';
import 'package:auth_interface/auth_repository.dart';
import 'app.dart';

/// Bootstraps the application with the given [authRepository] and [env].
Future<void> bootstrap({
  required AuthRepository authRepository,
  required String env,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Common initialization logic (e.g., logging, crashlytics, etc.) can be added here.

  runApp(
    MainApp(
      authRepository: authRepository,
      env: env,
    ),
  );
}
