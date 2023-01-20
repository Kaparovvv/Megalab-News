part of 'post_detail_bloc.dart';

abstract class PostDetailState extends Equatable {
  const PostDetailState();

  @override
  List<Object> get props => [];
}

class PostDetailInitial extends PostDetailState {}

class LoadingPostDetailState extends PostDetailState {}

class LoadedPostDetailState extends PostDetailState {
  final PostEntity postDetail;

  const LoadedPostDetailState({required this.postDetail});
}

class ErrorPostDetailState extends PostDetailState {
  final String message;

  const ErrorPostDetailState({required this.message});
}
