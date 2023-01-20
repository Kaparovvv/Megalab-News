import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';

abstract class PostDetailRepository {
  Future<Either<Failure, PostEntity>> getPostDetail(int postId);
}
