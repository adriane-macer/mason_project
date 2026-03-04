import '../../{{feature_name.snakeCase()}}_barrel.dart';

abstract class {{feature_name.pascalCase()}}LocalDataSource {
  Future<void> save({{return_type.pascalCase()}}Model data);
  Future<{{return_type.pascalCase()}}Model?> get();
  Future<void> clear();
}

class {{feature_name.pascalCase()}}LocalDataSourceImpl implements {{feature_name.pascalCase()}}LocalDataSource {
  {{return_type.pascalCase()}}Model? _cache;
  DateTime? _lastFetch;
  static const _ttl = Duration(minutes: 2);

  @override
  Future<void> save({{return_type.pascalCase()}}Model data) async {
    _cache = data;
    _lastFetch = DateTime.now();
  }

  @override
  Future<{{return_type.pascalCase()}}Model?> get() async {
    if (_cache != null && _lastFetch != null) {
      final isExpired = DateTime.now().difference(_lastFetch!) > _ttl;
      if (!isExpired) {
        return _cache;
      }
    }
    return null;
  }

  @override
  Future<void> clear() async {
    _cache = null;
    _lastFetch = null;
  }
}
