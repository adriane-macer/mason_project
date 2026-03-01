import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Demo{{feature_name.pascalCase()}}Api', () {
    test('returns the expected demo interests', () async {
      final api = Demo{{feature_name.pascalCase()}}Api();

      final result = await api.fetch({{feature_name.pascalCase()}}RequestParams(''));

      expect(result, hasLength(3));
      expect(result.map((interest) => interest.id), [1, 2, 3]);
    });
  });
}
