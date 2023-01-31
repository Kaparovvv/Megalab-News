import 'dart:convert';
import 'package:megalab_news_app/commons/names_helper.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/tag_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TagListLocalDataSource {
  Future<List<TagListModel>> getTagtListFromCache();
  Future<void> tagListToCache(List<TagListModel> tagListModel);
}

class TagListLocalDataSourceImpl implements TagListLocalDataSource {
  final SharedPreferences sharedPreferences;

  TagListLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<List<TagListModel>> getTagtListFromCache() {
    final jsonTagList =
        sharedPreferences.getStringList(NamesHelper.cachedTagList);
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

    sharedPreferences.setStringList(NamesHelper.cachedTagList, tagList);
    // ignore: void_checks
    return Future.value(tagList);
  }
}
