import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/comment_model.dart';

abstract class CommentRemoteDataSource {
  Future<CommentModel> commentToPost(int postId, String text);
  Future<CommentModel> commentToComment(int postId, String text, int parent);
}

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  ApiRequester requester = ApiRequester();
  @override
  Future<CommentModel> commentToPost(int postId, String text) async {
    Response response = await requester.toPost(
      commentUrl(),
      isToken: true,
      body: {
        "post": postId,
        "text": text,
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      CommentModel commentModel = CommentModel.fromJson(response.data);
      return commentModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CommentModel> commentToComment(
    int postId,
    String text,
    int parent,
  ) async {
    Response response = await requester.toPost(
      commentUrl(),
      isToken: true,
      body: {
        "post": postId,
        "text": text,
        "parent": parent,
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      CommentModel commentModel = CommentModel.fromJson(response.data);
      return commentModel;
    } else {
      throw ServerException();
    }
  }
}
