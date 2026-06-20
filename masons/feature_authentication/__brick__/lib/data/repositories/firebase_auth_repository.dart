import 'dart:developer';

import 'package:core_package/core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';

import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;

  @override
  Stream<AuthUser?> get onAuthStateChanged {
    return _firebaseAuth.idTokenChanges().asyncMap((user) async {
      if (user == null) return null;

      try {
        final token = await user.getIdToken();
        debugPrint("FirebaseAuthRepository.onAuthStateChanged : ");
        log(token.toString());

        return AuthUser(
          id: user.uid,
          email: user.email,
          displayName: user.displayName,
          token: token,
        );
      } catch (e) {
        debugPrint("FirebaseAuthRepository.onAuthStateChanged error: $e");
        return null;
      }
    });
  }

  @override
  AuthUser? get currentUser {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return AuthUser(
      id: user.uid,
      email: user.email,
      displayName: user.displayName,
    );
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }

  Failure _mapFirebaseAuthException(firebase_auth.FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
      case 'wrong-password':
      case 'invalid-credential':
        return const InvalidCredentialsFailure();
      case 'user-disabled':
        return const AccountDisabledFailure();
      case 'user-not-found':
        return const UserNotFoundFailure();
      case 'too-many-requests':
        return const TooManyRequestsFailure();
      case 'operation-not-allowed':
        return const OperationNotAllowedFailure();
      case 'weak-password':
        return const WeakPasswordFailure();
      case 'email-already-in-use':
        return const EmailAlreadyInUseFailure();
      default:
        return UnknownFailure(message: e.message ?? 'Authentication failed');
    }
  }
}
