import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Demo{{feature_name.pascalCase()}}Api', () {
    test('returns the expected demo {{entity_name.camelCase()}}s', () async {
      final api = Demo{{feature_name.pascalCase()}}Api();

      final result = await api.fetch();

      expect(result, hasLength(3));
      expect(result.map(({{entity_name.camelCase()}}) => {{entity_name.camelCase()}}.id), [1, 2, 3]);
    });
  });
}
