import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final PostToFavorites postToFavorites;
  final DeleteFromFavorites deleteFromFavorites;

  FavoritesBloc({
    required this.postToFavorites,
    required this.deleteFromFavorites,
  }) : super(FavoritesInitial()) {
    on<PostToFavoritesEvent>((event, emit) async {
      emit(LoadingToFavoritesState());
      final result = await postToFavorites(
        FavoritesParams(postId: event.postId),
      );

      result.fold(
          (failure) =>
              getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          (toFavorites) => emit(LoadedToFavoritesState()));
    });

    on<DeletePostFromFavoritesEvent>((event, emit) async {
      emit(LoadingDeleteFromFavoritesState());
      final result = await deleteFromFavorites(
        FavoritesParams(postId: event.postId),
      );

      result.fold(
        (failure) => getIt.get<FailureToMessage>().mapFailureToMessage(failure),
        (toFavorites) => emit(
          LoadedDeleteFromFavoritesState(),
        ),
      );
    });
  }
}
