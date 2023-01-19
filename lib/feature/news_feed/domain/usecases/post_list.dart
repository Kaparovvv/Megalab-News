import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/post_list_repository.dart';

class PostList extends UseCase<List<PostListEntity>, PostListParams> {
  final PostListRepository postListRepository;

  PostList(this.postListRepository);

  @override
  Future<Either<Failure, List<PostListEntity>>> call(
      PostListParams params) async {
    return await postListRepository.getPostList(
      params.search,
      params.tag,
      params.author,
    );
  }
}

class PostListParams extends Equatable {
  final String search;
  final String tag;
  final String author;

  const PostListParams({
    required this.search,
    required this.tag,
    required this.author,
  });

  @override
  List<Object?> get props => [
        search,
        tag,
        author,
      ];
}
