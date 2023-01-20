part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class LoadingPostListState extends PostState {}

class LoadedPostListState extends PostState {
  final List<PostEntity> postList;

  const LoadedPostListState({required this.postList});
}

class ErrorPostListState extends PostState {
  final String message;

  const ErrorPostListState({required this.message});
}
