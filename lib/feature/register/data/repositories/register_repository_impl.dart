import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/register/data/data_sources/user_local_data_source.dart';
import 'package:megalab_news_app/feature/register/data/data_sources/user_remote_data_source.dart';
import 'package:megalab_news_app/feature/register/data/models/user_data_model.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> registerUser(
    String nickname,
    String name,
    String lastName,
    // String profileImage,
    String password,
    String password2,
  ) async {
    return await _registerUser(
      () => remoteDataSource.registerUser(
        nickname,
        name,
        lastName,
        // profileImage,
        password,
        password2,
      ),
    );
  }

  Future<Either<Failure, UserEntity>> _registerUser(
    Future<UserDataModel> Function() register,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final remoteUser = await register();
        localDataSource.userDataToCache(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUser = await localDataSource.getUserDataFromCache();
        return Right(localUser);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
