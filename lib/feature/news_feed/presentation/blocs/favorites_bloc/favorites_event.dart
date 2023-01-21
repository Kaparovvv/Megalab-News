part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class PostToFavoritesEvent extends FavoritesEvent {
  final int postId;

  const PostToFavoritesEvent({required this.postId});
}

class DeletePostFromFavoritesEvent extends FavoritesEvent {
  final int postId;

  const DeletePostFromFavoritesEvent({required this.postId});
}
