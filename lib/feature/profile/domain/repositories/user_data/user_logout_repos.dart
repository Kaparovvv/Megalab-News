import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/user_logout_entity.dart';

abstract class UserLogoutRepository {
  Future<Either<Failure, UserLogoutEntity>> logoutUser();
}
