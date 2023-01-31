import 'dart:convert';

import 'package:megalab_news_app/commons/names_helper.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostDetailLocalDataSource {
  Future<PostModel> getPostDetailDataFromCache();
  Future<void> postDetailDataToCache(PostModel postDetailModel);
}

class PostDetailLocalDataSourceImpl implements PostDetailLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostDetailLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PostModel> getPostDetailDataFromCache() {
    final jsonPostDetail =
        sharedPreferences.getString(NamesHelper.cachedPostDetail);
    if (jsonPostDetail!.isNotEmpty) {
      return Future.value(
        PostModel.fromJson(
          jsonDecode(jsonPostDetail),
        ),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> postDetailDataToCache(PostModel postDetailModel) {
    return sharedPreferences.setString(
      NamesHelper.cachedPostDetail,
      json.encode(
        postDetailModel.toJson(),
      ),
    );
  }
}
