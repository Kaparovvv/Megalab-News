import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/tag_list_model.dart';

abstract class TagListRemoteDataSource {
  Future<List<TagListModel>> getTagList();
}

class TagListRemoteDataSourceImpl implements TagListRemoteDataSource {
  @override
  Future<List<TagListModel>> getTagList() async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toGet(
      tagListUrl(),
      isToken: true,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Get Tag List statusMessage ======= ${response.statusMessage}');
      List<TagListModel> tagListModel = response.data
          .map<TagListModel>((el) => TagListModel.fromJson(el))
          .toList();
      return tagListModel;
    } else {
      throw ServerException();
    }
  }
}
