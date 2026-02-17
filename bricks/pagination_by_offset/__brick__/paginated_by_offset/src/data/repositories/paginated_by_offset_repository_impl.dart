

import '../../../pagination_by_offset.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dartz/dartz.dart';

class PaginatedByOffsetRepositoryImpl<T> extends PaginatedByOffsetRepository{
  final PaginatedByOffsetRemoteDatasource<T> remote;
  final PaginatedByOffsetLocalDatasource<T> local;
  final LruPageCache<T> cache;
  final Duration ttl;

  final BehaviorSubject<List<T>> _stream = BehaviorSubject.seeded([]);

  Stream<List<T>> get stream => _stream.stream;

  PaginatedByOffsetRepositoryImpl({
    required this.remote,
    required this.local,
    required this.cache,
    this.ttl = const Duration(minutes: 5),
  });

  @override
  Future<void> fetchPage({
    required int offset,
    required int limit,
    Map<String, dynamic>? filters,
  }) async {
    final filterHash = generateFilterHash(filters);
    final pageKey = PageKey(
      offset: offset,
      limit: limit,
      filterHash: filterHash,
    );

    final cacheEntry = cache.get(pageKey);

    if (cacheEntry != null && !cacheEntry.isExpired(ttl)) {
      _stream.add(cache.mergePages());
    }

    final result = await remote.fetch(
      offset: offset,
      limit: limit,
      filters: filters,
    );

    result.fold((_) {}, (response) async {
      cache.put(pageKey, PageEntry(response.data));
      await local.savePage(pageKey.toString(), response.data);
      _stream.add(cache.mergePages());
    });
  }

  @override
  void invalidateFilter(String filterHash) {
    cache.removeWhere((key) => key is PageKey && key.filterHash == filterHash);
  }

  @override
  void dispose() {
    _stream.close();
  }
}
