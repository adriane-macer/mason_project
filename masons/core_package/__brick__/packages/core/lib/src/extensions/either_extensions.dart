import 'package:dartz/dartz.dart';

import '../error/failure.dart';

extension EitherExtensions<T>
on Either<Failure, T> {

  T? get data => fold(
        (_) => null,
        (data) => data,
  );

  Failure? get failure => fold(
        (failure) => failure,
        (_) => null,
  );

  bool get isSuccess => isRight();

  bool get isFailure => isLeft();
}