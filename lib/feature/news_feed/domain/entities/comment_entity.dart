import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';

// ignore: must_be_immutable
class CommentEntity extends Equatable {
  CommentEntity({
    this.id,
    this.user,
    this.text,
    this.child,
  });

  int? id;
  AuthorComment? user;
  String? text;
  List<dynamic>? child;

  @override
  List<Object?> get props => [
        id,
        user,
        text,
        child,
      ];
}
