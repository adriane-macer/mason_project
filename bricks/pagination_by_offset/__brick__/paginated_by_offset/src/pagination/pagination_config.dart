class PaginationConfig {
  /// Number of items per page
  final int pageSize;

  /// Cache time-to-live
  final Duration ttl;

  /// Maximum number of pages kept in memory (LRU limit)
  final int maxCachedPages;

  /// How early to prefetch next page (e.g. 0.7 means 70% scroll)
  final double prefetchThreshold;

  /// Debounce duration for refresh calls
  final Duration refreshDebounce;

  /// Whether stale data should be emitted immediately (SWR)
  final bool enableStaleWhileRevalidate;

  /// Whether local persistence is enabled
  final bool enablePersistence;

  /// Whether pages are merged automatically
  final bool autoMergePages;

  /// If true, expired pages are served once before refresh
  final bool serveExpiredOnce;

  const PaginationConfig({
    this.pageSize = 20,
    this.ttl = const Duration(minutes: 5),
    this.maxCachedPages = 5,
    this.prefetchThreshold = 0.7,
    this.refreshDebounce = const Duration(milliseconds: 300),
    this.enableStaleWhileRevalidate = true,
    this.enablePersistence = true,
    this.autoMergePages = true,
    this.serveExpiredOnce = false,
  })  : assert(pageSize > 0),
        assert(maxCachedPages > 0),
        assert(prefetchThreshold > 0 && prefetchThreshold <= 1);
}
