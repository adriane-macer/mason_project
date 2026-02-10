import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

void main(){
test('returns unit when API succeeds', () async {
when(() => remote.{{method_name}}())
    .thenAnswer((_) async {});

final result = await repository.{{method_name}}();

expect(result, right(unit));
});

}