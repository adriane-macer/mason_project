import 'package:{{package_name}}/data/repositories/api_auth_repository.dart';
import 'package:{{package_name}}/data/repositories/firebase_auth_repository.dart';
import 'package:{{package_name}}/data/repositories/mock_auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:core_package/core.dart';
import '../domain/repositories/auth_repository.dart';
import '../features/auth_status/domain/usecases/auth_state_changes.dart';
import '../features/auth_status/domain/usecases/sign_out.dart';
import '../features/auth_status/presentation/cubit/auth_cubit.dart';
import '../features/forgot_password/domain/usecases/reset_password.dart';
import '../features/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import '../features/login/domain/usecases/sign_in.dart';
import '../features/login/presentation/cubit/login_cubit.dart';

/// Module for registering Authentication dependencies.
class AuthenticationModule implements AppModule {
  @override
  Future<void> register(GetIt sl) async {
    // Repositories
    final authType = sl<AppConfig>().authType;
    sl.registerLazySingleton<AuthRepository>(() {
      switch (authType) {
        case AuthType.firebase:
          return FirebaseAuthRepository();
        case AuthType.rest:
          return ApiAuthRepository();
        case AuthType.mocked:
          return MockAuthRepository();
      }
    });

    // Use cases
    sl.registerLazySingleton(() => SignIn(sl<AuthRepository>()));
    sl.registerLazySingleton(() => SignOut(sl<AuthRepository>()));
    sl.registerLazySingleton(() => GetAuthStateChanges(sl<AuthRepository>()));
    sl.registerLazySingleton(() => ResetPassword(sl<AuthRepository>()));

    // Cubits
    sl.registerFactory(() => LoginCubit(signIn: sl<SignIn>()));
    sl.registerFactory(
      () => ForgotPasswordCubit(resetPassword: sl<ResetPassword>()),
    );
    sl.registerSingleton(AuthCubit(
      getAuthStateChanges: sl<GetAuthStateChanges>(),
      signOut: sl<SignOut>(),
      secureStorage: sl<LocalStorage>(),
      localDatabase: sl<LocalDatabase>(),
    ));
  }
}
