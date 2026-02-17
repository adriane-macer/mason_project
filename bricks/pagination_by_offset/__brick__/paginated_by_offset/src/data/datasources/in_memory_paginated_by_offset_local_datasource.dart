import 'package:dartz/dartz.dart';

import '../../../paginated_by_offset_barrel.dart';

class InMemoryPaginatedByOffsetLocalDatasource<T> implements PaginatedByOffsetLocalDatasource<T> {
  final Map<String, List<T>> _storage = {};

  @override
  Future<List<T>?> getPage(String key) async => _storage[key];

  @override
  Future<void> savePage(String key, List<T> items) async {
    _storage[key] = items;
  }

  @override
  Future<void> invalidateByFilter(String filterHash) async {
    _storage.removeWhere((key, _) => key.contains(filterHash));
  }
}
