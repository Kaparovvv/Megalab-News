import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/favorites_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, FavoritesEntity>> toFavorites(int postId);
  Future<Either<Failure, FavoritesEntity>> fromFavorites(int postId);
  Future<Either<Failure, List<PostEntity>>> getPostsFavorites();
}
