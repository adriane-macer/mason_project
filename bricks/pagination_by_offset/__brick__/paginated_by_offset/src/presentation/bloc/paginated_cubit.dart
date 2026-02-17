
import 'package:bloc/bloc.dart';


import '../../../paginated_by_offset_barrel.dart';

class PaginatedOffsetCubit<T> extends Cubit<List<T>> {
  final PaginatedByOffsetRepository<T> repository;

  PaginatedOffsetCubit(this.repository) : super([]) {
    (repository as PaginatedByOffsetRepositoryImpl)
        .stream.listen(emit as void Function(List<dynamic> event)?);
  }

  Future<void> fetchNext({
    required int offset,
    required int limit,
    Map<String, dynamic>? filters,
  }) {
    return repository.fetchPage(
      offset: offset,
      limit: limit,
      filters: filters,
    );
  }

  @override
  Future<void> close() {
    repository.dispose();
    return super.close();
  }
}
