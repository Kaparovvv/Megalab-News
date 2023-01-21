import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/btn_addto_favorites_widget.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

class FavoritesBlocProviderWidget extends StatelessWidget {
  final int postId;
  final bool isLiked;
  const FavoritesBlocProviderWidget({
    super.key,
    required this.postId,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesBloc(
        postToFavorites: getIt.get<PostToFavorites>(),
        deleteFromFavorites: getIt.get<DeleteFromFavorites>(),
      ),
      child: ButtonAddToFavoritesWidget(postId: postId, isLiked: isLiked),
    );
  }
}
