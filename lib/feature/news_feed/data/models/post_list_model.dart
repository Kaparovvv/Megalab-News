// To parse this JSON data, do
//
//     final postListModel = postListModelFromJson(jsonString);

import 'dart:convert';

import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';

List<PostListModel> postListModelFromJson(String str) =>
    List<PostListModel>.from(
        json.decode(str).map((x) => PostListModel.fromJson(x)));

String postListModelToJson(List<PostListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostListModel extends PostListEntity {
  PostListModel({
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

  factory PostListModel.fromJson(Map<String, dynamic> json) => PostListModel(
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

// class CommentModel extends Comment {
//   CommentModel({
//     required id,
//     required user,
//     required text,
//     required child,
//   });

//   factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
//         id: json["id"],
//         user: json["user"] == null ? null : AuthorCommentModel.fromJson(json["user"]),
//         text: json["text"],
//         child: json["child"] == null
//             ? []
//             : List<Comment>.from(
//                 json["child"]!.map((x) => CommentModel.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "user": user?.toJson(),
//         "text": text,
//         "child": child == null
//             ? []
//             : List<dynamic>.from(child!.map((x) => x.toJson())),
//       };
// }

// class AuthorCommentModel extends AuthorComment {
//   AuthorCommentModel({
//     required id,
//     required nickname,
//     required name,
//     required lastName,
//     required profileImage,
//   }) : super(
//           id: id,
//           nickname: nickname,
//           name: name,
//           lastName: lastName,
//           profileImage: profileImage,
//         );

//   factory AuthorCommentModel.fromJson(Map<String, dynamic> json) => AuthorCommentModel(
//         id: json["id"],
//         nickname: json["nickname"],
//         name: json["name"],
//         lastName: json["last_name"],
//         profileImage: json["profile_image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nickname": nickname,
//         "name": name,
//         "last_name": lastName,
//         "profile_image": profileImage,
//       };
// }
