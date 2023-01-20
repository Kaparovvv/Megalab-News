part of 'commenting_cubit.dart';

abstract class CommentingState extends Equatable {
  const CommentingState();

  @override
  List<Object> get props => [];
}

class CommentingInitial extends CommentingState {}

class ReplyToTheCommentState extends CommentingState {}

class CancelReplyToComment extends CommentingState {}
