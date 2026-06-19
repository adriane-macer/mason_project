import 'entities/user_detail_entity.dart';

abstract class LocalDatabase {
  Future<void> init();
  Future<void> saveUserDetail(UserDetailEntity userDetail);
  Future<UserDetailEntity?> getUserDetail(String userId);
  Future<UserDetailEntity?> getCurrentUser();
  Future<void> deleteUserDetail(String userId);
  Future<void> clearAll();
}
