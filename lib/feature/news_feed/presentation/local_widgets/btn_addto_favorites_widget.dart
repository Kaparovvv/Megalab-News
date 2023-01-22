import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/favorites_bloc/favorites_bloc.dart';

class ButtonAddToFavoritesWidget extends StatefulWidget {
  final int postId;
  final bool isLiked;
  const ButtonAddToFavoritesWidget({
    Key? key,
    required this.postId,
    required this.isLiked,
  }) : super(key: key);

  @override
  State<ButtonAddToFavoritesWidget> createState() =>
      _ButtonAddToFavoritesWidgetState();
}

class _ButtonAddToFavoritesWidgetState
    extends State<ButtonAddToFavoritesWidget> {
  late FavoritesBloc _favoritesBloc;

  @override
  void initState() {
    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesBloc, FavoritesState>(
      bloc: _favoritesBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingToFavoritesState) {
          return LoadingAnimationWidget.beat(
            color: ThemeHelper.red,
            size: 24,
          );
        }
        if (state is LoadingDeleteFromFavoritesState) {
          return LoadingAnimationWidget.beat(
            color: ThemeHelper.red,
            size: 24,
          );
        }
        if (state is LoadedDeleteFromFavoritesState) {
          BlocProvider.of<FavoriteListBloc>(context)
              .add(GetFromFavoritesListEvent());
          return CustomIconButtonWidget(
            onPressed: () => _favoritesBloc.add(
              PostToFavoritesEvent(postId: widget.postId),
            ),
            iconUrl: IconHelper.favourites,
            color: ThemeHelper.black,
            size: 24,
          );
        }
        if (state is LoadedToFavoritesState) {
          return CustomIconButtonWidget(
            onPressed: () => _favoritesBloc.add(
              DeletePostFromFavoritesEvent(postId: widget.postId),
            ),
            iconUrl: IconHelper.heart,
            color: ThemeHelper.red,
            size: 24,
          );
        }
        return CustomIconButtonWidget(
          onPressed: () => _favoritesBloc.add(
            widget.isLiked
                ? DeletePostFromFavoritesEvent(postId: widget.postId)
                : PostToFavoritesEvent(postId: widget.postId),
          ),
          iconUrl: widget.isLiked ? IconHelper.heart : IconHelper.favourites,
          color: widget.isLiked ? ThemeHelper.red : ThemeHelper.black,
          size: 24,
        );
      },
    );
  }
}
