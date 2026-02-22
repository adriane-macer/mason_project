class PageEntry<T> {
  final List<T> data;
  final DateTime createdAt;

  /// Optional: total count returned from backend
  final int? total;

  /// Optional: page metadata (useful for advanced cases)
  final Map<String, dynamic>? metadata;

  PageEntry(
      this.data, {
        DateTime? createdAt,
        this.total,
        this.metadata,
      }) : createdAt = createdAt ?? DateTime.now();

  /// Check if entry expired based on TTL
  bool isExpired(Duration ttl) {
    return DateTime.now().difference(createdAt) > ttl;
  }

  /// Age in seconds (useful for debugging/metrics)
  int get ageInSeconds =>
      DateTime.now().difference(createdAt).inSeconds;

  /// Create copy with new data (immutability safe)
  PageEntry<T> copyWith({
    List<T>? data,
    DateTime? createdAt,
    int? total,
    Map<String, dynamic>? metadata,
  }) {
    return PageEntry<T>(
      data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      total: total ?? this.total,
      metadata: metadata ?? this.metadata,
    );
  }
}
