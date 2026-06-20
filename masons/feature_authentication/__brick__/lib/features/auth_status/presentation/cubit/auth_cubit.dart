import 'dart:async';
import 'package:authentication/features/auth_status/domain/usecases/sign_out.dart';
import 'package:bootstrap_shared/bootstrap_shared.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_package/core.dart';

import '../../../../authentication.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState {
  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user = AuthUser.empty,
  });

  const AuthState.authenticated(AuthUser user)
    : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
    : this._(status: AuthStatus.unauthenticated);

  const AuthState.unknown() : this._();

  final AuthStatus status;
  final AuthUser user;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required GetAuthStateChanges getAuthStateChanges,
    required SignOut signOut,
    required LocalStorage secureStorage,
    required LocalDatabase localDatabase,
  }) : _getAuthStateChanges = getAuthStateChanges,
       _signOut = signOut,
       _secureStorage = secureStorage,
       _localDatabase = localDatabase,
       super(const AuthState.unknown()) {
    _init();
    _authSubscription = _getAuthStateChanges().listen(_onAuthStateChanged);
  }

  final GetAuthStateChanges _getAuthStateChanges;
  final SignOut _signOut;
  final LocalStorage _secureStorage;
  final LocalDatabase _localDatabase;
  late StreamSubscription<AuthUser?> _authSubscription;

  Future<void> _init() async {
    try {
      final cachedUser = await _localDatabase.getCurrentUser();
      if (cachedUser != null) {
        final token = await _secureStorage.read(key: 'user_token');
        emit(
          AuthState.authenticated(
            AuthUser(
              id: cachedUser.userId,
              email: cachedUser.email,
              displayName: cachedUser.displayName,
              token: token,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('AuthCubit._init error: $e');
    }
  }

  Future<void> _onAuthStateChanged(AuthUser? user) async {
    if (user == null || user.isEmpty) {
      await _secureStorage.delete(key: 'user_token');
      await _localDatabase.clearAll();
      sl<DioClient>().dio.options.headers['Authorization'] =
      null;
      emit(const AuthState.unauthenticated());
    } else {
      if (user.token != null) {
        await _secureStorage.write(key: 'user_token', value: user.token);
        sl<DioClient>().dio.options.headers['Authorization'] =
            'Bearer ${user.token}';
      }

      final userDetail = UserDetailEntity(
        userId: user.id,
        email: user.email,
        displayName: user.displayName,
      );

      await _localDatabase.saveUserDetail(userDetail);
      emit(AuthState.authenticated(user));
    }
  }

  Future<void> logOut() async {
    await _signOut();
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
