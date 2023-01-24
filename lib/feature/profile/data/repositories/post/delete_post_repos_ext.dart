import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/profile/data/data_sources/post/delete_post_remote_souce.dart';
import 'package:megalab_news_app/feature/profile/data/models/delete_post_model.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/delete_post_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/post/delete_post_repos.dart';

class DeletePostReposExt extends DeletePostRepository {
  final DeletePostRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  DeletePostReposExt({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DeletePostEntity>> deletePost(int postId) async {
    return await _deletePost(
      () => remoteSource.deletePost(postId),
    );
  }

  Future<Either<Failure, DeletePostEntity>> _deletePost(
    Future<DeletePostModel> Function() deletePost,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final isDelete = await deletePost();
        return Right(isDelete);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        const isDelete = DeletePostModel(isDelete: false);
        return const Right(isDelete);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
