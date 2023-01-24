import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_logout_entity.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/user_data/user_logout_repos.dart';

class UserLogout extends UseCaseNoParams<UserLogoutEntity> {
  final UserLogoutRepository logoutRepository;

  UserLogout(this.logoutRepository);

  @override
  Future<Either<Failure, UserLogoutEntity>> call() async {
    return await logoutRepository.logoutUser();
  }
}
