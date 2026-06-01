import 'package:flutter/material.dart';
import 'package:auth_interface/auth_repository.dart';

class MainApp extends StatelessWidget {
  final AuthRepository authRepository;
  final String env;

  const MainApp({
    super.key,
    required this.authRepository,
    required this.env,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Owner App ($env)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Unit Owner App - $env'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Environment: $env'),
              const SizedBox(height: 20),
              StreamBuilder<String?>(
                stream: authRepository.onAuthStateChanged,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Logged in as: ${snapshot.data}');
                  }
                  return const Text('Not logged in');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
