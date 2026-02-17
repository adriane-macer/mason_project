enum CacheStrategy {
  /// Always fetch remote, ignore cache
  networkOnly,

  /// Serve cache if valid, otherwise fetch
  cacheFirst,

  /// Serve cache immediately, always revalidate in background
  staleWhileRevalidate,

  /// Serve cache only, never call network
  cacheOnly,
}

class CachePolicy {
  final CacheStrategy strategy;

  /// Time-to-live for cache expiration
  final Duration ttl;

  /// Whether expired cache can still be served once
  final bool serveExpiredCache;

  /// Whether to fallback to cache if network fails
  final bool fallbackOnError;

  /// Whether persistence layer should be used
  final bool enablePersistence;

  const CachePolicy({
    this.strategy = CacheStrategy.staleWhileRevalidate,
    this.ttl = const Duration(minutes: 5),
    this.serveExpiredCache = true,
    this.fallbackOnError = true,
    this.enablePersistence = true,
  });

  /// Determine if cache is still valid
  bool isValid(DateTime createdAt) {
    return DateTime.now().difference(createdAt) <= ttl;
  }

  /// Should we fetch from network?
  bool shouldFetch({
    required bool hasCache,
    required bool isExpired,
  }) {
    switch (strategy) {
      case CacheStrategy.networkOnly:
        return true;

      case CacheStrategy.cacheOnly:
        return false;

      case CacheStrategy.cacheFirst:
        return !hasCache || isExpired;

      case CacheStrategy.staleWhileRevalidate:
        return true;
    }
  }

  /// Should we emit cache immediately?
  bool shouldServeCache({
    required bool hasCache,
    required bool isExpired,
  }) {
    switch (strategy) {
      case CacheStrategy.networkOnly:
        return false;

      case CacheStrategy.cacheOnly:
        return hasCache;

      case CacheStrategy.cacheFirst:
        if (!hasCache) return false;
        if (isExpired) return serveExpiredCache;
        return true;

      case CacheStrategy.staleWhileRevalidate:
        if (!hasCache) return false;
        if (isExpired) return serveExpiredCache;
        return true;
    }
  }
}
