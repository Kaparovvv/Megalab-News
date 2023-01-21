import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/comment_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/comment_repositry.dart';

class CommentToPost extends UseCase<CommentEntity, CommentToPostParams> {
  final CommentRepository commentToPostRepos;

  CommentToPost(this.commentToPostRepos);

  @override
  Future<Either<Failure, CommentEntity>> call(
      CommentToPostParams params) async {
    return await commentToPostRepos.commentToPost(
      params.postId,
      params.text,
    );
  }
}

class CommentToPostParams extends Equatable {
  final int postId;
  final String text;

  const CommentToPostParams({
    required this.postId,
    required this.text,
  });

  @override
  List<Object?> get props => [postId, text];
}
