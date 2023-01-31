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

class ErrorUserDataState extends UserDataState {
  final String message;

  const ErrorUserDataState({required this.message});
}

class LoadingPutUserDataState extends UserDataState {}

class LoadedPutUserDataState extends UserDataState {
  final UserDataEntity userDataEntity;

  const LoadedPutUserDataState({required this.userDataEntity});
}
