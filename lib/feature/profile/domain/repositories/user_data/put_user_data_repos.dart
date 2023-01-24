import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_data_entity.dart';

abstract class PutUserDataRepository {
  Future<Either<Failure, UserDataEntity>> putUserData(
    String nickname,
    String name,
    String lastName,
    File? profileImage,
  );
}
