import 'package:flutter_bloc/flutter_bloc.dart';

part '{{feature_name.snakeCase()}}_state.dart';

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
final AuthService authService;

{{feature_name.pascalCase()}}Cubit(this.authService)
    : super({{feature_name.pascalCase()}}Initial());

Future<void> checkAuth() async {
await Future.delayed(const Duration(seconds: 2));

final isSignedIn = await authService.isSignedIn();

if (isSignedIn) {
emit({{feature_name.pascalCase()}}Authenticated());
} else {
emit({{feature_name.pascalCase()}}Unauthenticated());
}
}
}