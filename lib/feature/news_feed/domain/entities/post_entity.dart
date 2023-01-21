import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PostEntity extends Equatable {
  PostEntity({
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

  @override
  List<Object?> get props => [
        id,
        tag,
        title,
        text,
        image,
        isLiked,
        comment,
        shortDesc,
        author,
      ];
}

class Comment {
  Comment({
    this.id,
    this.user,
    this.text,
    this.child,
  });

  int? id;
  AuthorComment? user;
  String? text;
  List<Comment?>? child;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        user:
            json["user"] == null ? null : AuthorComment.fromJson(json["user"]),
        text: json["text"],
        child: json["child"] == null
            ? []
            : List<Comment>.from(
                json["child"]!.map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "text": text,
        "child": child == null
            ? []
            : List<dynamic>.from(child!.map((x) => x!.toJson())),
      };
}

class AuthorComment {
  AuthorComment({
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

  factory AuthorComment.fromJson(Map<String, dynamic> json) => AuthorComment(
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
