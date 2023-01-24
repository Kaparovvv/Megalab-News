import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';

// ignore: must_be_immutable
class PostModel extends PostEntity {
  PostModel({
    required id,
    required tag,
    required title,
    required text,
    required image,
    required isLiked,
    required comment,
    required shortDesc,
    required author,
  }) : super(
          id: id,
          tag: tag,
          title: title,
          text: text,
          image: image,
          isLiked: isLiked,
          comment: comment,
          shortDesc: shortDesc,
          author: author,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        tag: json["tag"],
        title: json["title"],
        text: json["text"],
        image: json["image"],
        isLiked: json["is_liked"],
        comment: json["comment"] == null
            ? []
            : List<Comment>.from(
                json["comment"]!.map((x) => Comment.fromJson(x))),
        shortDesc: json["short_desc"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
        "title": title,
        "text": text,
        "image": image,
        "is_liked": isLiked,
        "comment": comment == null
            ? []
            : List<dynamic>.from(comment!.map((x) => x!.toJson())),
        "short_desc": shortDesc,
        "author": author,
      };
}
