import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/post_list_repository.dart';

class PostList extends UseCase<List<PostEntity>, PostListParams> {
  final PostListRepository postListRepository;

  PostList(this.postListRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(PostListParams params) async {
    return await postListRepository.getPostList(
      params.search ?? '',
      params.tag ?? '',
      params.author ?? '',
    );
  }
}

class PostListParams extends Equatable {
  final String? search;
  final String? tag;
  final String? author;

  const PostListParams({
    this.search,
    this.tag,
    this.author,
  });

  @override
  List<Object?> get props => [
        search,
        tag,
        author,
      ];
}
