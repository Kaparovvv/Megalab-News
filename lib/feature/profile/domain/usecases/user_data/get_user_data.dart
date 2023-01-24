import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_data_entity.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/user_data/user_data_repository.dart';

class GetUserData extends UseCaseNoParams<UserDataEntity> {
  final UserDataRepository userDataRepository;

  GetUserData(this.userDataRepository);

  @override
  Future<Either<Failure, UserDataEntity>> call() async {
    return await userDataRepository.getUserData();
  }
}
