// To parse this JSON data, do
//
//     final postListEntities = postListEntitiesFromJson(jsonString);

import 'dart:convert';

class PostListEntities {
  PostListEntities({
    this.id,
    this.tag,
    this.title,
    this.text,
    this.image,
    this.isLiked,
    this.comment,
    this.shortDesc,
    this.author,
  });

  int? id;
  String? tag;
  String? title;
  String? text;
  String? image;
  bool? isLiked;
  List<Comment?>? comment;
  String? shortDesc;
  String? author;

  factory PostListEntities.fromRawJson(String str) =>
      PostListEntities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PostListEntities.fromJson(Map<String, dynamic> json) =>
      PostListEntities(
        id: json["id"],
        tag: json["tag"],
        title: json["title"],
        text: json["text"],
        image: json["image"],
        isLiked: json["is_liked"],
        comment: json["comment"] == null
            ? []
            : json["comment"] == null
                ? []
                : List<Comment?>.from(
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
            : comment == null
                ? []
                : List<dynamic>.from(comment!.map((x) => x!.toJson())),
        "short_desc": shortDesc,
        "author": author,
      };
}

class Comment {
  Comment({
    this.id,
    this.user,
    this.text,
    this.child,
  });

  int? id;
  User? user;
  String? text;
  List<Comment?>? child;

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        user: json["user"],
        text: json["text"],
        child: json["child"] == null
            ? []
            : json["child"] == null
                ? []
                : List<Comment?>.from(
                    json["child"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "text": text,
        "child": child == null
            ? []
            : child == null
                ? []
                : List<dynamic>.from(child!.map((x) => x!.toJson())),
      };
}

class User {
  User({
    this.id,
    this.nickname,
    this.name,
    this.lastName,
    this.profileImage,
  });

  int? id;
  String? nickname;
  String? name;
  String? lastName;
  String? profileImage;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nickname: json["nickname"],
        name: json["name"],
        lastName: json["last_name"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "name": name,
        "last_name": lastName,
        "profile_image": profileImage,
      };
}
