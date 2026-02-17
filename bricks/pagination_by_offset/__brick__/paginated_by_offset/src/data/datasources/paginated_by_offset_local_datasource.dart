
import '../../../paginated_by_offset_barrel.dart';

abstract class PaginatedByOffsetLocalDatasource<T> {
  Future<void> savePage(String key, List<T> items);
  Future<List<T>?> getPage(String key);
  Future<void> invalidateByFilter(String filterHash);
}
