import 'package:isar_plus/isar_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'local_database.dart';
import 'entities/user_detail_entity.dart';
import 'models/isar_user_detail.dart';

class IsarDatabaseImpl implements LocalDatabase {
  Isar? _isar;

  @override
  Future<void> init() async {
    if (_isar != null) return;
    final dir = await getApplicationDocumentsDirectory();
    _isar = Isar.open(
      schemas: [IsarUserDetailSchema],
      directory: dir.path,
    );
  }

  @override
  Future<void> saveUserDetail(UserDetailEntity userDetail) async {
    _isar?.write((isar) {
      final isarUser = IsarUserDetail.fromEntity(userDetail);
      final existing = isar.isarUserDetails
          .where()
          .userIdEqualTo(userDetail.userId)
          .findFirst();
      if (existing != null) {
        isarUser.id = existing.id;
      }
      isar.isarUserDetails.put(isarUser);
    });
  }

  @override
  Future<UserDetailEntity?> getUserDetail(String userId) async {
    final result = _isar?.isarUserDetails
        .where()
        .userIdEqualTo(userId)
        .findFirst();
    return result?.toEntity();
  }

  @override
  Future<UserDetailEntity?> getCurrentUser() async {
    final result = _isar?.isarUserDetails.where().findFirst();
    return result?.toEntity();
  }

  @override
  Future<void> deleteUserDetail(String userId) async {
    _isar?.write((isar) {
      isar.isarUserDetails
          .where()
          .userIdEqualTo(userId)
          .deleteFirst();
    });
  }

  @override
  Future<void> clearAll() async {
    _isar?.write((isar) {
      isar.clear();
    });
  }
}
