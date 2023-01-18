import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserEntity>> registerUser(
    String nickname,
    String name,
    String lastName,
    // String profileImage,
    String password,
    String password2,
  );
}
