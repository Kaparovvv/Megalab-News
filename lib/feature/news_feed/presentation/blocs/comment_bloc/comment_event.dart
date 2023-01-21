part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CommentToPostEvent extends CommentEvent {
  final int postId;
  final String text;

  const CommentToPostEvent({
    required this.postId,
    required this.text,
  });
}

class CommentToCommentEvent extends CommentEvent {
  final int postId;
  final String text;
  final int parent;

  const CommentToCommentEvent({
    required this.postId,
    required this.text,
    required this.parent,
  });
}
