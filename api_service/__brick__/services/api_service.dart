import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class I{{name.pascalCase()}}Service {
Future<List<{{name.pascalCase()}}>> fetchItems();
}

class {{name.pascalCase()}}Service implements I{{name.pascalCase()}}Service {
final http.Client client;
{{name.pascalCase()}}Service(this.client);

@override
Future<List<{{name.pascalCase()}}>> fetchItems() async {
final response = await client.get(Uri.parse('https://api.example.com/{{name.snakeCase()}}s'));

if (response.statusCode == 200) {
List data = json.decode(response.body);
return data.map((item) => {{name.pascalCase()}}.fromJson(item)).toList();
} else {
throw Exception('Failed to load data');
}
}
}