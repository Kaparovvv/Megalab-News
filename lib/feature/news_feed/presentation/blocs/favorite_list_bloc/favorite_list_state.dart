part of 'favorite_list_bloc.dart';

abstract class FavoriteListState extends Equatable {
  const FavoriteListState();

  @override
  List<Object> get props => [];
}

class FavoriteListInitial extends FavoriteListState {}

class LoadingGetFromFavoritesState extends FavoriteListState {}

class LoadedGetFromFavoritesState extends FavoriteListState {
  final List<PostEntity> favoritesList;

  const LoadedGetFromFavoritesState({required this.favoritesList});
}

class ErrorGetFromFavoritesState extends FavoriteListState {
  final String message;

  const ErrorGetFromFavoritesState({required this.message});
}
