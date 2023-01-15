import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/register/data/models/user_data_model.dart';
import 'package:megalab_news_app/services/api_requester/api_requester.dart';

abstract class UserRemoteDataSource {
  Future<UserDataModel> registerUser(
    String nickname,
    String name,
    String lastName,
    String profileImage,
    String password,
    String password2,
  );
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<UserDataModel> registerUser(
    String nickname,
    String name,
    String lastName,
    String profileImage,
    String password,
    String password2,
  ) async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toPost(registerUserUrl(), body: {
      'nickname': nickname,
      'name': name,
      'last_name': lastName,
      'profile_image': profileImage,
      'password': password,
      'password2': password2,
    });
    log('Register response ======= ${response.statusMessage}');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      UserDataModel userDataModel = UserDataModel.fromJson(response.data);
      log('Register response ======= ${response.data}');

      return userDataModel;
    } else {
      throw ServerException();
    }
  }
}
