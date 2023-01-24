import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final PostsFromFavorites postsFromFavorites;

  FavoriteListBloc({required this.postsFromFavorites})
      : super(FavoriteListInitial()) {
    on<GetFromFavoritesListEvent>((event, emit) async {
      emit(LoadingGetFromFavoritesState());
      final result = await postsFromFavorites(const PostListParams());

      result.fold(
        (failure) => emit(
          ErrorGetFromFavoritesState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (favoritesList) => emit(
          LoadedGetFromFavoritesState(favoritesList: favoritesList),
        ),
      );
    });
  }
}
