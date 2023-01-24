import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required id,
    required name,
    required lastName,
    required nickname,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          nickname: nickname,
        );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        id: json["id"],
        name: json["name"],
        lastName: json["last_name"],
        nickname: json["nickname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "last_name": lastName,
        "nickname": nickname,
      };
}
