part of 'post_list_bloc.dart';

abstract class PostListState extends Equatable {
  const PostListState();

  @override
  List<Object> get props => [];
}

class PostListInitial extends PostListState {}

class LoadingPostListState extends PostListState {}

class LoadedPostListState extends PostListState {
  final List<PostListEntity> postList;

  const LoadedPostListState({required this.postList});
}

class ErrorPostListState extends PostListState {
  final String message;

  const ErrorPostListState({required this.message});
}
