import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/profile/data/models/delete_post_model.dart';

abstract class DeletePostRemoteSource {
  Future<DeletePostModel> deletePost(int postId);
}

class DeletePostRemoteSourceImpl implements DeletePostRemoteSource {
  @override
  Future<DeletePostModel> deletePost(int postId) async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toDelete(
      deletePostUrl(postId),
      isToken: true,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Delete Post statusMessage ======= ${response.statusCode}');
      DeletePostModel deletePostModel = const DeletePostModel(isDelete: true);
      return deletePostModel;
    } else {
      throw ServerException();
    }
  }
}
