import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/favorites_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/favorites_repository.dart';

class PostToFavorites extends UseCase<FavoritesEntity, FavoritesParams> {
  final FavoritesRepository favoritesRepository;

  PostToFavorites(this.favoritesRepository);

  @override
  Future<Either<Failure, FavoritesEntity>> call(FavoritesParams params) async {
    return await favoritesRepository.toFavorites(params.postId);
  }
}

class DeleteFromFavorites extends UseCase<FavoritesEntity, FavoritesParams> {
  final FavoritesRepository favoritesRepository;

  DeleteFromFavorites(this.favoritesRepository);

  @override
  Future<Either<Failure, FavoritesEntity>> call(FavoritesParams params) async {
    return await favoritesRepository.fromFavorites(params.postId);
  }
}

class FavoritesParams extends Equatable {
  final int postId;

  const FavoritesParams({required this.postId});

  @override
  List<Object?> get props => [postId];
}
