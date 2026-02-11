import 'package:flutter/material.dart';
import 'flavor_config.dart';

Future<void> bootstrap({
  required Flavor flavor,
  required String baseUrl,
  required bool enableLogging,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.create(
    flavor: flavor,
    baseUrl: baseUrl,
    enableLogging: enableLogging,
  );

  // TODO: initialize DI, Firebase, Crashlytics, etc.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = FlavorConfig.instance;

    return MaterialApp(
      title: '{{app_name}}',
      home: Scaffold(
        body: Center(
          child: Text(
            'Flavor: ${config.flavor.name}\nBaseUrl: ${config.baseUrl}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
