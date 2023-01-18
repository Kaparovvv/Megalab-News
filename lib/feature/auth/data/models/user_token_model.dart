import 'package:megalab_news_app/feature/auth/domain/entities/user_token_entity.dart';

class UserTokenModel extends UserTokenEntity {
  const UserTokenModel({required token}) : super(token: token);

  factory UserTokenModel.fromJson(Map<String, dynamic> json) => UserTokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
