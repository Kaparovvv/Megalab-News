part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class LoadingToFavoritesState extends FavoritesState {}

class LoadedToFavoritesState extends FavoritesState {}

class ErrorToFavoritesState extends FavoritesState {
  final String message;

  const ErrorToFavoritesState({required this.message});
}

class LoadingDeleteFromFavoritesState extends FavoritesState {}

class LoadedDeleteFromFavoritesState extends FavoritesState {}

class ErrorDeleteFromFavoritesState extends FavoritesState {
  final String message;

  const ErrorDeleteFromFavoritesState({required this.message});
}
