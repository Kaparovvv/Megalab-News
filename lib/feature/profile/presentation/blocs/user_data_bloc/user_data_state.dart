part of 'user_data_bloc.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserDataState {}

class LoadingGetUserDataState extends UserDataState {}

class LoadedGetUserDataState extends UserDataState {
  final UserDataEntity userDataEntity;

  const LoadedGetUserDataState({required this.userDataEntity});
}

class ErrorGetUserDataState extends UserDataState {
  final String message;

  const ErrorGetUserDataState({required this.message});
}

class LoadingPutUserDataState extends UserDataState {}

class LoadedPutUserDataState extends UserDataState {
  final UserDataEntity userDataEntity;

  const LoadedPutUserDataState({required this.userDataEntity});
}

class ErrorPutUserDataState extends UserDataState {
  final String message;

  const ErrorPutUserDataState({required this.message});
}
