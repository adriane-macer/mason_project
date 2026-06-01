import 'package:flutter/material.dart';
import 'package:auth_interface/auth_repository.dart';
import 'app.dart';

Future<void> bootstrap({
  required AuthRepository authRepository,
  required String env,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MainApp(
      authRepository: authRepository,
      env: env,
    ),
  );
}
