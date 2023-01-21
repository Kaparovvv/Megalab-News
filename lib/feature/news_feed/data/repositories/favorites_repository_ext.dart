import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/favorites/favorites_local_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/favorites/favorites_remote_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/favorites_model.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/favorites_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryExt extends FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;
  final FavoritesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FavoritesRepositoryExt({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, FavoritesEntity>> fromFavorites(int postId) async {
    return await _fromFavorites(() => remoteDataSource.fromFavorites(postId));
  }

  @override
  Future<Either<Failure, FavoritesEntity>> toFavorites(int postId) async {
    return await _toFavorites(() => remoteDataSource.toFavorites(postId));
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getPostsFavorites() async {
    return await _getFavorites(() => remoteDataSource.getFavorites());
  }

  Future<Either<Failure, FavoritesEntity>> _toFavorites(
    Future<FavoritesModel> Function() toFavorites,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final postToFavorites = await toFavorites();
        return Right(postToFavorites);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw ServerException();
    }
  }

  Future<Either<Failure, FavoritesEntity>> _fromFavorites(
    Future<FavoritesModel> Function() fromFavorites,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final deleteFromFavorites = await fromFavorites();
        return Right(deleteFromFavorites);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw ServerException();
    }
  }

  Future<Either<Failure, List<PostEntity>>> _getFavorites(
    Future<List<PostModel>> Function() getFavorites,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final remoteFavorites = await getFavorites();
        localDataSource.favoritesToCache(remoteFavorites);
        return Right(remoteFavorites);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localFavorites = await localDataSource.getFavoritesFromCache();
        return Right(localFavorites);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
