part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UserRegisterEvent extends RegisterEvent {
  final String nickname;
  final String name;
  final String lastName;
  final String password;
  final String password2;

  const UserRegisterEvent({
    required this.nickname,
    required this.name,
    required this.lastName,
    required this.password,
    required this.password2,
  });
}
