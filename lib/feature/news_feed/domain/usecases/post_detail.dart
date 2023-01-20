import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/post_detail_repository.dart';

class PostDetail extends UseCase<PostEntity, PostDetailParams> {
  final PostDetailRepository postDetailRepository;

  PostDetail(this.postDetailRepository);

  @override
  Future<Either<Failure, PostEntity>> call(PostDetailParams params) async {
    return await postDetailRepository.getPostDetail(
      params.postId,
    );
  }
}

class PostDetailParams extends Equatable {
  final int postId;

  const PostDetailParams({required this.postId});

  @override
  List<Object?> get props => [postId];
}
