import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:dashboard_shared/dashboard_shared.dart';
import 'package:feature_user/feature_user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_names.dart';

abstract class BaseAppRouter {

  BaseAppRouter(this.authRepository) {
    _authSubscription = authRepository.onAuthStateChanged.listen((user) {
      currentUser = user;
      if (isInitialized) {
        _refreshListenable.notify();
      }
    });
  }

  final AuthRepository authRepository;
  late final StreamSubscription<AuthUser?> _authSubscription;
  
  @visibleForTesting
  AuthUser? currentUser;
  
  @visibleForTesting
  bool isInitialized = false;

  final _refreshListenable = RouterRefreshListenable();

  late final GoRouter config = GoRouter(
    initialLocation: AppRoutePaths.splash,
    refreshListenable: _refreshListenable,
    redirect: redirect,
    routes: [
      GoRoute(
        path: AppRoutePaths.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => SplashPage(
          onInitializationComplete: () {
            isInitialized = true;
            _refreshListenable.notify();
          },
        ),
      ),
      GoRoute(
        path: AppRoutePaths.login,
        name: AppRouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutePaths.forgotPassword,
        name: AppRouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRoutePaths.userInit,
        name: AppRouteNames.userInit,
        builder: (context, state) => const UserInitializationPage(),
      ),
      GoRoute(
        path: AppRoutePaths.profile,
        name: AppRouteNames.profile,
        builder: (context, state) => const ProfilePage(),
      ),
      ...routes,
    ],
  );

  List<RouteBase> get routes;

  String? redirect(BuildContext context, GoRouterState state) {
    if (!isInitialized) {
      return state.matchedLocation == AppRoutePaths.splash
          ? null
          : AppRoutePaths.splash;
    }

    final isLoggedIn = currentUser != null && currentUser!.isNotEmpty;
    final isLoggingIn = state.matchedLocation == AppRoutePaths.login;
    final isForgotPassword =
        state.matchedLocation == AppRoutePaths.forgotPassword;
    final isSplash = state.matchedLocation == AppRoutePaths.splash;

    if (!isLoggedIn && !isLoggingIn && !isForgotPassword) {
      return AppRoutePaths.login;
    }
    if (isLoggedIn && (isLoggingIn || isSplash || isForgotPassword)) {
      return AppRoutePaths.userInit;
    }

    return null;
  }

  void dispose() {
    _authSubscription.cancel();
    _refreshListenable.dispose();
  }
}

class RouterRefreshListenable extends ChangeNotifier {
  void notify() => notifyListeners();
}
