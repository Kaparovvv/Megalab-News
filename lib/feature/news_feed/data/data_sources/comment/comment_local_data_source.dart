import 'dart:convert';

import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/comment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CommentLocalDataSource {
  Future<CommentModel> getCommentDataFromCache();
  Future<void> commentDataToCache(CommentModel commentModel);
}

const CACHED_COMMENT_DATA = 'CACHED_COMMENT_DATA ';

class CommentLocalDataSourceImpl implements CommentLocalDataSource {
  final SharedPreferences sharedPreferences;

  CommentLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<CommentModel> getCommentDataFromCache() {
    final jsonComment = sharedPreferences.getString(CACHED_COMMENT_DATA);
    if (jsonComment!.isNotEmpty) {
      return Future.value(
        CommentModel.fromJson(
          jsonDecode(jsonComment),
        ),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> commentDataToCache(CommentModel commentModel) {
    return sharedPreferences.setString(
      CACHED_COMMENT_DATA,
      json.encode(
        commentModel.toJson(),
      ),
    );
  }
}
