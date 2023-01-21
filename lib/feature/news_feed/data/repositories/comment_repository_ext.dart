import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/comment/comment_local_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/comment/comment_remote_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/comment_model.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/comment_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/comment_repositry.dart';

class CommentRepositoryExt extends CommentRepository {
  final CommentLocalDataSource localDataSource;
  final CommentRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CommentRepositoryExt({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CommentEntity>> commentToComment(
    int postId,
    String text,
    int parent,
  ) async {
    return await _getCommentData(
      () => remoteDataSource.commentToComment(
        postId,
        text,
        parent,
      ),
    );
  }

  @override
  Future<Either<Failure, CommentEntity>> commentToPost(
    int postId,
    String text,
  ) async {
    return await _getCommentData(
      () => remoteDataSource.commentToPost(postId, text),
    );
  }

  Future<Either<Failure, CommentEntity>> _getCommentData(
    Future<CommentModel> Function() getCommentData,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final commentData = await getCommentData();
        localDataSource.commentDataToCache(commentData);
        return Right(commentData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCommentData =
            await localDataSource.getCommentDataFromCache();
        return Right(localCommentData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
