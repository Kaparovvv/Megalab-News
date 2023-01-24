import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/profile/data/models/user_data_model.dart';

abstract class UserDataRemoteSource {
  Future<UserDataModel> getUserData();
}

class UserDataRemoteSourceImpl implements UserDataRemoteSource {
  @override
  Future<UserDataModel> getUserData() async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toGet(
      userDataUrl(),
      isToken: true,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Get UserData statusMessage ======= ${response.statusMessage}');
      UserDataModel postModel = UserDataModel.fromJson(response.data);
      return postModel;
    } else {
      throw ServerException();
    }
  }
}
