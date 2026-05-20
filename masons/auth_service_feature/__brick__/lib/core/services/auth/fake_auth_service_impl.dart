import 'auth_service.dart';

class Fake{{service_name.pascalCase()}}ServiceImpl
implements {{service_name.pascalCase()}}Service {

String? _token;

@override
Future<bool> isSignedIn() async {
  return _token != null && _token!.isNotEmpty;
}

@override
Future<void> saveToken(String token) async {
  _token = token;
}

@override
Future<String?> getToken() async {
  return _token;
}

@override
Future<void> logout() async {
  _token = null;
}
}