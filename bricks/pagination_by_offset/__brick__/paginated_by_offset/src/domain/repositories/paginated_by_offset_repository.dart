abstract class PaginatedByOffsetRepository<T> {
  Future<void> fetchPage({
    required int offset,
    required int limit,
    Map<String, dynamic>? filters,
  });

  void invalidateFilter(String filterHash);

  void dispose();
}
