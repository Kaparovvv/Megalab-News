part of 'delete_post_bloc.dart';

abstract class DeletePostEvent extends Equatable {
  const DeletePostEvent();

  @override
  List<Object> get props => [];
}

class DeleteNewsPostEvent extends DeletePostEvent {
  final int postId;

  const DeleteNewsPostEvent({required this.postId});
}
