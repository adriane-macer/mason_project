import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_service.dart';

class AuthServiceImpl implements {{service_name.pascalCase()}}Service {
final FlutterSecureStorage _storage;

final String tokenKey;

AuthServiceImpl({
FlutterSecureStorage? storage,
this.tokenKey = '{{token_key}}',
}) : _storage = storage ?? const FlutterSecureStorage();

@override
Future<bool> isSignedIn() async {
final token = await _storage.read(key: tokenKey);
return token != null && token.isNotEmpty;
}

@override
Future<void> saveToken(String token) async {
await _storage.write(key: tokenKey, value: token);
}

@override
Future<String?> getToken() async {
return _storage.read(key: tokenKey);
}

@override
Future<void> logout() async {
await _storage.delete(key: tokenKey);
}
}