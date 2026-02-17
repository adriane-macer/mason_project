class PaginatedResponse<T> {
  final List<T> data;
  final int total;

  PaginatedResponse({
    required this.data,
    required this.total,
  });
}
