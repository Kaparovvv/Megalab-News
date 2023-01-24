part of 'create_post_bloc.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class LoadingCreatePostState extends CreatePostState {}

class LoadedCreatePostState extends CreatePostState {
  final CreatePostEntity createPostEntity;

  const LoadedCreatePostState({required this.createPostEntity});
}

class ErrorCreatePostState extends CreatePostState {
  final String message;

  const ErrorCreatePostState({required this.message});
}
