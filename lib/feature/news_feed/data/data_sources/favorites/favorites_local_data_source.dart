import 'dart:convert';

import 'package:megalab_news_app/commons/names_helper.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

abstract class FavoritesLocalDataSource {
  Future<List<PostModel>> getFavoritesFromCache();
  Future<void> favoritesToCache(List<PostModel> favoritesModel);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final SharedPreferences sharedPreferences;

  FavoritesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PostModel>> getFavoritesFromCache() {
    final jsonFavorites =
        sharedPreferences.getStringList(NamesHelper.cachedFavorites);
    if (jsonFavorites!.isNotEmpty) {
      return Future.value(
        jsonFavorites
            .map((post) => PostModel.fromJson(json.decode(post)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> favoritesToCache(List<PostModel> favoritesModel) {
    final List<String> listFavorites =
        favoritesModel.map((post) => json.encode(post.toJson())).toList();

    sharedPreferences.setStringList(NamesHelper.cachedFavorites, listFavorites);
    // ignore: void_checks
    return Future.value(listFavorites);
  }
}
