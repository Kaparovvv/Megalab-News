part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostListEvent extends PostEvent {}

class GetPostListByTagEvent extends PostEvent {
  final List<String> tags;

  const GetPostListByTagEvent({required this.tags});
}

class GetPostListByQueryEvent extends PostEvent {
  final String query;

  const GetPostListByQueryEvent({required this.query});
}

class GetPostListByAuthorEvent extends PostEvent {
  final String author;

  const GetPostListByAuthorEvent({required this.author});
}
