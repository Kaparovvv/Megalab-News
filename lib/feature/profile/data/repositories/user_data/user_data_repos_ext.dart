import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/profile/data/models/user_data_model.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_data_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

class UserDataRepositoryExt extends UserDataRepository {
  final UserDataLocalSource localDataSource;
  final UserDataRemoteSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserDataRepositoryExt({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserDataEntity>> getUserData() async {
    return await _getUserDataSourse(
      () => remoteDataSource.getUserData(),
    );
  }

  Future<Either<Failure, UserDataEntity>> _getUserDataSourse(
    Future<UserDataModel> Function() getUserData,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final remoteUserData = await getUserData();
        localDataSource.userDataToCache(remoteUserData);
        return Right(remoteUserData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUserData = await localDataSource.getUserDataFromCache();
        return Right(localUserData);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
