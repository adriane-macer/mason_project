import 'package:isar/isar.dart';

import '../isar/user_entity.dart';
import '../models/user_model.dart';

class AuthLocalDataSource {
  final Isar isar;

  AuthLocalDataSource(this.isar);

  Future<void> saveUser(UserModel user) async {
    final entity = UserEntity()
      ..userId = user.id
      ..name = user.name
      ..email = user.email;

    await isar.writeTxn(() async {
      await isar.userEntitys.clear();
      await isar.userEntitys.put(entity);
    });
  }
}