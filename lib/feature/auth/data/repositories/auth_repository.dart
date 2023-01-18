import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/auth/data/data_sources/user_token_local_data_source.dart';
import 'package:megalab_news_app/feature/auth/data/data_sources/user_token_remote_data_source.dart';
import 'package:megalab_news_app/feature/auth/data/models/user_token_model.dart';
import 'package:megalab_news_app/feature/auth/domain/entities/user_token_entity.dart';
import 'package:megalab_news_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserTokenRemoteDataSource remoteDataSource;
  final UserTokenLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserTokenEntity>> authUser(
    String nickname,
    String password,
  ) async {
    return await _authUser(
      () => remoteDataSource.authUser(nickname, password),
    );
  }

  Future<Either<Failure, UserTokenEntity>> _authUser(
      Future<UserTokenModel> Function() auth) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final remoteToken = await auth();
        localDataSource.userTokenToCache(remoteToken);
        return Right(remoteToken);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localToken = await localDataSource.getUserTokenFromCache();
        return Right(localToken);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
