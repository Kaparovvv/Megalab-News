import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';

abstract class PostListRepository {
  Future<Either<Failure, List<PostListEntity>>> getPostList(
    String search,
    String tag,
    String author,
  );
}
