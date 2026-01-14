import 'package:flutter/material.dart';
import '../models/{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}ViewModel extends ChangeNotifier {
List<{{name.pascalCase()}}> _items = [];
bool _isLoading = false;

List<{{name.pascalCase()}}> get items => _items;
bool get isLoading => _isLoading;

Future<void> fetch{{name.pascalCase()}}s() async {
_isLoading = true;
notifyListeners();

// Simulating API call
await Future.delayed(const Duration(seconds: 2));
_items = List.generate(10, (i) => {{name.pascalCase()}}(id: i, title: '{{name.pascalCase()}} $i'));

_isLoading = false;
notifyListeners();
}
}