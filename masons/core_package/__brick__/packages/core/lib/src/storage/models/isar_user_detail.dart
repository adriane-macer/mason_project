import 'package:isar_plus/isar_plus.dart';
import '../entities/user_detail_entity.dart';

part 'isar_user_detail.g.dart';

@collection
class IsarUserDetail {
  int id = 0;

  @Index(unique: true)
  late String userId;

  String? email;
  String? displayName;
  String? photoUrl;

  static IsarUserDetail fromEntity(UserDetailEntity entity) {
    return IsarUserDetail()
      ..userId = entity.userId
      ..email = entity.email
      ..displayName = entity.displayName
      ..photoUrl = entity.photoUrl;
  }

  UserDetailEntity toEntity() {
    return UserDetailEntity(
      userId: userId,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
    );
  }
}
