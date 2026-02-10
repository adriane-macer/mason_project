import 'package:flutter/material.dart';

class {{name.pascalCase()}}ViewModel extends ChangeNotifier {
final I{{name.pascalCase()}}Service _service;

{{name.pascalCase()}}ViewModel(this._service);

List<{{name.pascalCase()}}> _items = [];
bool _isLoading = false;
String? _errorMessage;

List<{{name.pascalCase()}}> get items => _items;
bool get isLoading => _isLoading;
String? get errorMessage => _errorMessage;

Future<void> loadData() async {
_isLoading = true;
_errorMessage = null;
notifyListeners();

try {
_items = await _service.fetchItems();
} catch (e) {
_errorMessage = e.toString();
} finally {
_isLoading = false;
notifyListeners();
}
}
}