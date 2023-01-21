import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/favorites_repository.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/post/post_list.dart';

class PostsFromFavorites extends UseCase<List<PostEntity>, PostListParams> {
  final FavoritesRepository favoritesRepository;

  PostsFromFavorites(this.favoritesRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(PostListParams params) async {
    return await favoritesRepository.getPostsFavorites();
  }
}
