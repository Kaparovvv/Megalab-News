import 'package:megalab_news_app/feature/news_feed/domain/entities/favorites_entity.dart';

// ignore: must_be_immutable
class FavoritesModel extends FavoritesEntity {
  FavoritesModel({required userId, required postId})
      : super(userId: userId, postId: postId);

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
        userId: json["user"],
        postId: json["post"],
      );

  Map<String, dynamic> toJson() => {
        "user": userId,
        "post": postId,
      };
}
