part of 'delete_post_bloc.dart';

abstract class DeletePostState extends Equatable {
  const DeletePostState();

  @override
  List<Object> get props => [];
}

class DeletePostInitial extends DeletePostState {}

class LoadingDeletePostState extends DeletePostState {}

class LoadedDeletePostState extends DeletePostState {
  final DeletePostEntity deletePostEntity;

  const LoadedDeletePostState({required this.deletePostEntity});
}

class ErrorDeletePostState extends DeletePostState {
  final String message;

  const ErrorDeletePostState({required this.message});
}
