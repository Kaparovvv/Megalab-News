import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CreatePostEntity extends Equatable {
  CreatePostEntity({
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
  List<dynamic>? comment;
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
