import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';

abstract class PostListRemoteDataSource {
  Future<List<PostModel>> getPostList(
    String search,
    String tag,
    String author,
  );
}

class PostListRemoteDataSourceImpl implements PostListRemoteDataSource {
  @override
  Future<List<PostModel>> getPostList(
    String search,
    String tag,
    String author,
  ) async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toGet(
      postListUrl(),
      isToken: true,
      queryParam: {
        "search": search,
        "tag": tag,
        "author": author,
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Get POst List statusMessage ======= ${response.statusMessage}');

      List<PostModel> postListModel =
          response.data.map<PostModel>((el) => PostModel.fromJson(el)).toList();
      return postListModel;
    } else {
      throw ServerException();
    }
  }
}
