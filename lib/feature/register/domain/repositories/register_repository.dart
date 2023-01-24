import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterEntity>> registerUser(
    String nickname,
    String name,
    String lastName,
    String password,
    String password2,
  );
}
