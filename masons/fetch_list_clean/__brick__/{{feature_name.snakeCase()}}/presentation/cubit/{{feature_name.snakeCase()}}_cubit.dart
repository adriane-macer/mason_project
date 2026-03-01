import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  final {{feature_name.pascalCase()}}UseCase useCase;

  Timer? _debounce;
  int _requestId = 0;

  {{feature_name.pascalCase()}}Cubit(this.useCase)
    : super(const {{feature_name.pascalCase()}}State.initial());

  Future<void> fetchInitial() {
    return _fetch(limit: limit, isRefresh: false);
  }

  Future<void> refresh() {
    return _fetch(limit: limit, isRefresh: true);
  }

  void fetchInitialDebounced({
    int limit = 20,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    _debounce?.cancel();
    _debounce = Timer(duration, () {
      unawaited(fetchInitial(limit: limit));
    });
  }

  Future<void> _fetch({required int limit, required bool isRefresh}) async {
    final currentRequestId = ++_requestId;
    emit(
      state.copyWith(
        status: isRefresh
            ? {{feature_name.pascalCase()}}Status.refreshing
            : {{feature_name.pascalCase()}}Status.loading,
        clearFailure: true,
      ),
    );

    final result = await useCase(

    );

    if (isClosed || currentRequestId != _requestId) {
      return;
    }

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: {{feature_name.pascalCase()}}Status.failure,
            failure: failure,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            status: {{feature_name.pascalCase()}}Status.success,
            data: data,
            clearFailure: true,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
