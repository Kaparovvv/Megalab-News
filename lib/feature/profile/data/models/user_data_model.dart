import 'package:megalab_news_app/feature/profile/domain/entities/user_data_entity.dart';

class UserDataModel extends UserDataEntity {
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
