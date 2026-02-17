import 'package:dartz/dartz.dart';
import '../../../paginated_by_offset_barrel.dart';

abstract class PaginatedByOffsetRemoteDatasource<T> {
  Future<Either<Failure, PaginatedResponse<T>>> fetch({
    required int offset,
    required int limit,
    Map<String, dynamic>? filters,
  });
}
