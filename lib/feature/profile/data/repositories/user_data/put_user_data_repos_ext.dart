import 'dart:io';

import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/profile/data/data_sources/put_user_data/put_user_data_remote_source.dart';
import 'package:megalab_news_app/feature/profile/data/models/user_data_model.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_data_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/user_data/put_user_data_repos.dart';

class PutUserDataReposExt extends PutUserDataRepository {
  final PutUserDataRemoteSource remoteDataSource;

  PutUserDataReposExt({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, UserDataEntity>> putUserData(
    String nickname,
    String name,
    String lastName,
    File? profileImage,
  ) async {
    return await _putUserDataSource(
      () => remoteDataSource.putUserData(
        nickname,
        name,
        lastName,
        profileImage,
      ),
    );
  }

  Future<Either<Failure, UserDataEntity>> _putUserDataSource(
    Future<UserDataModel> Function() putUserData,
  ) async {
    try {
      final remoteUserData = await putUserData();
      return Right(remoteUserData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
