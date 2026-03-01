import 'package:flutter_test/flutter_test.dart';

void main() {
  group('{{entity_name.pascalCase()}}Model', () {
    const t{{entity_name.pascalCase()}}Model = {{entity_name.pascalCase()}}Model(id: 1);
    const t{{entity_name.pascalCase()}} = {{entity_name.pascalCase()}}(id: 1);

    test('should be a subclass of {{entity_name.pascalCase()}} entity', () {
      expect(t{{entity_name.pascalCase()}}Model.toEntity(), isA<{{entity_name.pascalCase()}}>());
      expect(t{{entity_name.pascalCase()}}Model.toEntity(), t{{entity_name.pascalCase()}});
    });

    group('fromJson', () {
      test('should return a valid model from JSON', () {
        final Map<String, dynamic> jsonMap = {'id': 1};
        final result = {{entity_name.pascalCase()}}Model.fromJson(jsonMap);
        expect(result, t{{entity_name.pascalCase()}}Model);
      });
    });

    group('toJson', () {
      test('should return a JSON map containing the proper data', () {
        final result = t{{entity_name.pascalCase()}}Model.toJson();
        final expectedMap = {'id': 1};
        expect(result, expectedMap);
      });
    });
  });
}
