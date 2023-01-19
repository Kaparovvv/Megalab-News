import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/post_list_local_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/post_list_remote_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_list_model.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/post_list_repository.dart';

class PostListRepositoryImpl extends PostListRepository {
  final PostListLocalDataSource localDataSource;
  final PostListRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PostListRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PostListEntity>>> getPostList(
    String search,
    String tag,
    String author,
  ) async {
    return await _getPostList(
      () => remoteDataSource.getPostList(
        search,
        tag,
        author,
      ),
    );
  }

  Future<Either<Failure, List<PostListEntity>>> _getPostList(
    Future<List<PostListModel>> Function() getPostList,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final remotePostList = await getPostList();
        localDataSource.postListDataToCache(remotePostList);
        return Right(remotePostList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPostList = await localDataSource.getPostListDataFromCache();
        return Right(localPostList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
