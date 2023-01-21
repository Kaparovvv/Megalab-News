import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/tag_list/tag_list_local_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/tag_list/tag_list_remote_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/tag_list_model.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/tag_list_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/tag_list_repository.dart';

class TagListRepositoryExt extends TagListRepository {
  final TagListLocalDataSource localDataSource;
  final TagListRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TagListRepositoryExt({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TagListEntity>>> getTagList() async {
    return await _getTagList(() => remoteDataSource.getTagList());
  }

  Future<Either<Failure, List<TagListEntity>>> _getTagList(
    Future<List<TagListModel>> Function() getTagList,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final remoteTagList = await getTagList();
        localDataSource.tagListToCache(remoteTagList);
        return Right(remoteTagList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTagList = await localDataSource.getTagtListFromCache();
        return Right(localTagList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
