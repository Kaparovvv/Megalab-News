part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class LoadedRegisterState extends RegisterState {
  final RegisterEntity userEntity;

  const LoadedRegisterState({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class ErrorRegisterState extends RegisterState {
  final String message;

  const ErrorRegisterState({required this.message});

  @override
  List<Object> get props => [message];
}
