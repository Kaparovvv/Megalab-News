part of 'post_list_bloc.dart';

abstract class PostListEvent extends Equatable {
  const PostListEvent();

  @override
  List<Object> get props => [];
}

class GetPostListEvent extends PostListEvent {}

class GetPostListByTagEvent extends PostListEvent {
  final List<String> tags;

  const GetPostListByTagEvent({required this.tags});
}

class GetPostListByQueryEvent extends PostListEvent {
  final String query;

  const GetPostListByQueryEvent({required this.query});
}

class GetPostListByAuthorEvent extends PostListEvent {
  final String author;

  const GetPostListByAuthorEvent({required this.author});
}
