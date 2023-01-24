import 'package:megalab_news_app/feature/news_feed/domain/entities/comment_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';

// ignore: must_be_immutable
class CommentModel extends CommentEntity {
  CommentModel({
    required id,
    required user,
    required text,
    required child,
  }) : super(
          id: id,
          user: user,
          text: text,
          child: child,
        );

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        user:
            json["user"] == null ? null : AuthorComment.fromJson(json["user"]),
        text: json["text"],
        child: json["child"] == null
            ? []
            : List<dynamic>.from(json["child"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "text": text,
        "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x)),
      };
}
