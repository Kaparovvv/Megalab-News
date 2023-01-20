import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/post_detail/post_detail_local_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/post_detail/post_detail_remote_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/post_detail_repository.dart';

class PostDetailRepositoryImpl extends PostDetailRepository {
  final PostDetailLocalDataSource localDataSource;
  final PostDetailRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PostDetailRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PostEntity>> getPostDetail(int postId) async {
    return await _getPostDetail(
      () => remoteDataSource.getPostDetail(postId),
    );
  }

  Future<Either<Failure, PostEntity>> _getPostDetail(
    Future<PostModel> Function() getPostDetail,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final remotePostDetail = await getPostDetail();
        localDataSource.postDetailDataToCache(remotePostDetail);
        return Right(remotePostDetail);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPostDetail =
            await localDataSource.getPostDetailDataFromCache();
        return Right(localPostDetail);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
