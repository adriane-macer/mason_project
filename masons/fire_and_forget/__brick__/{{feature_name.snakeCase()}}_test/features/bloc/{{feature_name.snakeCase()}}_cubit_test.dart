import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';


void main(){

  blocTest<{{feature_name.pascalCase()}}Cubit,
  {{feature_name.pascalCase()}}State>(
  'emits loading → success',
  build: () {
  when(() => useCase())
      .thenAnswer((_) async => right(unit));
  return cubit;
  },
  act: (cubit) => cubit.{{method_name}}(),
  expect: () => [
  state.copyWith(status: Status.loading),
  state.copyWith(status: Status.success),
  ],
  );
}
