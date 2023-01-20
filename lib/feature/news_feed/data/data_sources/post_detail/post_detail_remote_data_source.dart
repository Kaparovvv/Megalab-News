import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';

abstract class PostDetailRemoteDataSource {
  Future<PostModel> getPostDetail(int postId);
}

class PostDetailRemoteDataSourceImpl implements PostDetailRemoteDataSource {
  @override
  Future<PostModel> getPostDetail(int postId) async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toGet(
      postDetailUrl(postId),
      isToken: true,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Get POst Detail statusMessage ======= ${response.statusMessage}');
      PostModel postModel = PostModel.fromJson(response.data);
      return postModel;
    } else {
      throw ServerException();
    }
  }
}
