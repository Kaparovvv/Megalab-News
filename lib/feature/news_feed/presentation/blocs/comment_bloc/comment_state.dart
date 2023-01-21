part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

//CommentToPost
class LoadingCommentToPostState extends CommentState {}

class LoadedCommentToPostState extends CommentState {
  final CommentEntity commentEntity;

  const LoadedCommentToPostState({required this.commentEntity});
}

class ErrorCommentToPostState extends CommentState {
  final String message;

  const ErrorCommentToPostState({required this.message});
}

//CommentToComment
class LoadingCommentToCommentState extends CommentState {}

class LoadedCommentToCommentState extends CommentState {
  final CommentEntity commentEntity;

  const LoadedCommentToCommentState({required this.commentEntity});
}

class ErrorCommentToCommentState extends CommentState {
  final String message;

  const ErrorCommentToCommentState({required this.message});
}
