import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/comment_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/comment_repositry.dart';

class CommentToComment extends UseCase<CommentEntity, CommentToCommentParams> {
  final CommentRepository commentToCommentRepos;

  CommentToComment(this.commentToCommentRepos);

  @override
  Future<Either<Failure, CommentEntity>> call(
      CommentToCommentParams params) async {
    return await commentToCommentRepos.commentToComment(
      params.postId,
      params.text,
      params.parent,
    );
  }
}

class CommentToCommentParams extends Equatable {
  final int postId;
  final String text;
  final int parent;

  const CommentToCommentParams({
    required this.postId,
    required this.text,
    required this.parent,
  });

  @override
  List<Object?> get props => [
        postId,
        text,
        parent,
      ];
}
