part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserEvent extends AuthEvent {
  final String nickname;
  final String password;

  const AuthUserEvent({
    required this.nickname,
    required this.password,
  });
}
