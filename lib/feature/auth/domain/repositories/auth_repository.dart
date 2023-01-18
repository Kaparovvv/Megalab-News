import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/auth/domain/entities/user_token_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserTokenEntity>> authUser(
    String nickname,
    String password,
  );
}
