import 'package:{{project_name.snakeCase()}}/core/services/storages/cached_timers/cached_timer_barrel.dart';

class {{return_class.pascalCase()}}CachedTimer extends AbstractCachedTimerStorage {
  static const _KEY = "{{return_class.camelCase()}}CachedTimer";

  @override
  void clearTimer() {
    storage.remove(_KEY);
  }

  @override
  String? readTimer() {
    return storage.read(_KEY);
  }

  @override
  void writeTimer({required String date}) {
    storage.write(_KEY, date);
  }
}
