import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_data_entity.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/user_data/put_user_data_repos.dart';

class PutUserData extends UseCase<UserDataEntity, PutUserDataParams> {
  final PutUserDataRepository putUserDataRepository;

  PutUserData(this.putUserDataRepository);

  @override
  Future<Either<Failure, UserDataEntity>> call(PutUserDataParams params) async {
    return await putUserDataRepository.putUserData(
      params.nickname,
      params.name,
      params.lastName,
      params.profileImage,
    );
  }
}

class PutUserDataParams extends Equatable {
  final String nickname;
  final String name;
  final String lastName;
  final File? profileImage;

  const PutUserDataParams({
    required this.nickname,
    required this.name,
    required this.lastName,
    this.profileImage,
  });
  @override
  List<Object?> get props => [
        nickname,
        name,
        lastName,
        profileImage,
      ];
}
