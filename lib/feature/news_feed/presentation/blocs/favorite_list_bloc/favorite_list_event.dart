part of 'favorite_list_bloc.dart';

abstract class FavoriteListEvent extends Equatable {
  const FavoriteListEvent();

  @override
  List<Object> get props => [];
}

class GetFromFavoritesListEvent extends FavoriteListEvent {}
