import 'package:get_it/get_it.dart';

/// Abstract class for modular dependency registration.
abstract class AppModule {
  /// Registers dependencies for the module.
  Future<void> register(GetIt sl);
}
