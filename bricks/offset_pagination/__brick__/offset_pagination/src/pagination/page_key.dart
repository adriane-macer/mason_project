class PageKey {
  final int offset;
  final int limit;
  final String filterHash;

  PageKey({
    required this.offset,
    required this.limit,
    required this.filterHash,
  });

  @override
  bool operator ==(Object other) =>
      other is PageKey &&
          offset == other.offset &&
          limit == other.limit &&
          filterHash == other.filterHash;

  @override
  int get hashCode => Object.hash(offset, limit, filterHash);
}
