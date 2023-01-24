import 'dart:convert';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/tag_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TagListLocalDataSource {
  Future<List<TagListModel>> getTagtListFromCache();
  Future<void> tagListToCache(List<TagListModel> tagListModel);
}

const CACHED_TAG_LIST = 'CACHED_TAG_LIST';

class TagListLocalDataSourceImpl implements TagListLocalDataSource {
  final SharedPreferences sharedPreferences;

  TagListLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<TagListModel>> getTagtListFromCache() {
    final jsonTagList = sharedPreferences.getStringList(CACHED_TAG_LIST);
    if (jsonTagList!.isNotEmpty) {
      return Future.value(
        jsonTagList
            .map((tag) => TagListModel.fromJson(json.decode(tag)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> tagListToCache(List<TagListModel> tagListModel) {
    final List<String> tagList =
        tagListModel.map((tag) => json.encode(tag.toJson())).toList();

    sharedPreferences.setStringList(CACHED_TAG_LIST, tagList);
    // ignore: void_checks
    return Future.value(tagList);
  }
}
