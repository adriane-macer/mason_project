import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_local_datasource.dart';
import '../datasource/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
    required this.secureStorage,
  });

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await remote.login(
      email: email,
      password: password,
    );

    await secureStorage.write(
      key: 'access_token',
      value: response.token,
    );

    await local.saveUser(response.user);

    return response.user;
  }
}