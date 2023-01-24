part of 'logout_bloc.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LoadingLogoutState extends LogoutState {}

class LoadedLogoutState extends LogoutState {
  final UserLogoutEntity logoutEntity;

  const LoadedLogoutState({required this.logoutEntity});
}

class ErrorLogoutState extends LogoutState {
  final String message;

  const ErrorLogoutState({required this.message});
}
