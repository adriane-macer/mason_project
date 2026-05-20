abstract class {{service_name.pascalCase()}}Service {
Future<bool> isSignedIn();

Future<void> saveToken(String token);

Future<String?> getToken();

Future<void> logout();
}