import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';
import 'package:megalab_news_app/feature/register/domain/repositories/register_repository.dart';

class RegisterUser extends UseCase<UserEntity, UserDataParams> {
  final RegisterRepository registerRepository;

  RegisterUser(this.registerRepository);

  @override
  Future<Either<Failure, UserEntity>> call(UserDataParams params) async {
    return await registerRepository.registerUser(
      params.nickname,
      params.name,
      params.lastName,
      params.profileImage,
      params.password,
      params.password2,
    );
  }
}

class UserDataParams extends Equatable {
  final String nickname;
  final String name;
  final String lastName;
  final String profileImage;
  final String password;
  final String password2;

  const UserDataParams({
    required this.nickname,
    required this.name,
    required this.lastName,
    required this.profileImage,
    required this.password,
    required this.password2,
  });
  @override
  List<Object?> get props => [
        nickname,
        name,
        lastName,
        profileImage,
        password,
        password2,
        nickname,
        name,
      ];
}
