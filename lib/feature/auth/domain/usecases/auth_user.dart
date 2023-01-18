import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/auth/domain/entities/user_token_entity.dart';
import 'package:megalab_news_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthUser extends UseCase<UserTokenEntity, AuthUserParams> {
  final AuthRepository authRepository;

  AuthUser(this.authRepository);

  @override
  Future<Either<Failure, UserTokenEntity>> call(AuthUserParams params) async {
    return await authRepository.authUser(params.nickname, params.password);
  }
}

class AuthUserParams extends Equatable {
  final String nickname;
  final String password;

  const AuthUserParams({
    required this.nickname,
    required this.password,
  });

  @override
  List<Object?> get props => [nickname, password];
}
