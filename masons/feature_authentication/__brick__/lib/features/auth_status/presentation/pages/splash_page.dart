import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.onInitializationComplete});

  final VoidCallback onInitializationComplete;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    // Simulate some initialization logic (e.g., checking local storage, loading config)
    await Future.delayed(const Duration(seconds: 3));
    widget.onInitializationComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/kumpas_prop_with_text.png",
              width: 200,
              package: "core_package",
            ),
            const Gap.xl(),
            const AppLoader(),
          ],
        ),
      ),
    );
  }
}
