import 'package:megalab_news_app/feature/profile/domain/entities/create_post_entity.dart';

// ignore: must_be_immutable
class CreatePostModel extends CreatePostEntity {
  CreatePostModel({
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

  factory CreatePostModel.fromJson(Map<String, dynamic> json) =>
      CreatePostModel(
        id: json["id"],
        tag: json["tag"],
        title: json["title"],
        text: json["text"],
        image: json["image"],
        isLiked: json["is_liked"],
        comment: json["comment"] == null
            ? []
            : List<dynamic>.from(json["comment"]!.map((x) => x)),
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
        "comment":
            comment == null ? [] : List<dynamic>.from(comment!.map((x) => x)),
        "short_desc": shortDesc,
        "author": author,
      };
}
