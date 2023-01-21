import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<Either<Failure, CommentEntity>> commentToPost(
    int postId,
    String text,
  );

  Future<Either<Failure, CommentEntity>> commentToComment(
    int postId,
    String text,
    int parent,
  );
}
