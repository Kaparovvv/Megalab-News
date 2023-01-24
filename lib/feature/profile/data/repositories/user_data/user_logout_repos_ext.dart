import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/profile/data/models/user_logout_model.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_logout_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../utils/dependencies_export.dart';

class UserLogoutReposExt extends UserLogoutRepository {
  final UserLogoutRemoteSource remoteSource;
  final NetworkInfo networkInfo;

  UserLogoutReposExt({
    required this.remoteSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserLogoutEntity>> logoutUser() async {
    return await _userLogout(
      () => remoteSource.userLogout(),
    );
  }

  Future<Either<Failure, UserLogoutEntity>> _userLogout(
    Future<UserLogoutModel> Function() userLogout,
  ) async {
    if (await networkInfo.isConnected == ConnectivityResult.mobile ||
        await networkInfo.isConnected == ConnectivityResult.wifi) {
      try {
        final isLogout = await userLogout();
        return Right(isLogout);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        const isLogout = UserLogoutModel(isLogout: false);
        return const Right(isLogout);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
