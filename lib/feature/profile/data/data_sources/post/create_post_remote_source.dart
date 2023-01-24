import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/profile/data/models/create_post_model.dart';

import '../../../../../core/error/exception.dart';

abstract class CreatePostRemoteSource {
  Future<CreatePostModel> createPost(
    String title,
    String text,
    File? image,
    String tag,
    String shortDesc,
  );
}

class CreatePostRemoteSourceImpl implements CreatePostRemoteSource {
  FormData formData = FormData();

  @override
  Future<CreatePostModel> createPost(
    String title,
    String text,
    File? image,
    String tag,
    String shortDesc,
  ) async {
    if (image != null) {
      String imageFile = image.path.split('/').last;
      formData = FormData.fromMap({
        "title": title,
        "text": text,
        "image": await MultipartFile.fromFile(image.path, filename: imageFile),
        "tag": tag,
        "short_desc": shortDesc,
      });
    } else {
      formData = FormData.fromMap({
        "title": title,
        "text": text,
        "image": '',
        "tag": tag,
        "short_desc": shortDesc,
      });
    }

    ApiRequester requester = ApiRequester();
    Response response = await requester.toCreatePost(
      createPostUrl(),
      isToken: true,
      formData: formData,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Create Post statusMessage ======= ${response.statusMessage}');
      CreatePostModel createPostModel = CreatePostModel.fromJson(response.data);
      return createPostModel;
    } else {
      throw ServerException();
    }
  }
}
