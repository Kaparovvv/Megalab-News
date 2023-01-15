import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';

class UserDataModel extends UserEntity {
  const UserDataModel({
    required id,
    required name,
    required lastName,
    required nickname,
    required profileImage,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          nickname: nickname,
          profileImage: profileImage,
        );

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        nickname: json["nickname"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "nickname": nickname,
        "profile_image": profileImage,
      };
}
