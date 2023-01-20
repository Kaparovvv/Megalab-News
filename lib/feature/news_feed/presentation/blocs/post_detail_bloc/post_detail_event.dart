part of 'post_detail_bloc.dart';

abstract class PostDetailEvent extends Equatable {
  const PostDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPostDetailEvent extends PostDetailEvent {
  final int postId;

  const GetPostDetailEvent({required this.postId});
}
