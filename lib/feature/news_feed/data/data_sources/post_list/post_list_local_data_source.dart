import 'dart:convert';

import 'package:megalab_news_app/commons/names_helper.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostListLocalDataSource {
  Future<List<PostModel>> getPostListDataFromCache();
  Future<void> postListDataToCache(List<PostModel> postListModel);
}

class PostListLocalDataSourceImpl implements PostListLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostListLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PostModel>> getPostListDataFromCache() {
    final jsonPostList =
        sharedPreferences.getStringList(NamesHelper.cachedPostList);
    if (jsonPostList!.isNotEmpty) {
      return Future.value(
        jsonPostList
            .map((post) => PostModel.fromJson(json.decode(post)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> postListDataToCache(List<PostModel> postListModel) {
    final List<String> postList =
        postListModel.map((post) => json.encode(post.toJson())).toList();

    sharedPreferences.setStringList(NamesHelper.cachedPostList, postList);
    // ignore: void_checks
    return Future.value(postList);
  }
}
