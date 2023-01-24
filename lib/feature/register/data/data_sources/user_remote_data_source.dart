import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/register/data/models/register_model.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';

abstract class UserRemoteDataSource {
  Future<RegisterModel> registerUser(
    String nickname,
    String name,
    String lastName,
    String password,
    String password2,
  );
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<RegisterModel> registerUser(
    String nickname,
    String name,
    String lastName,
    String password,
    String password2,
  ) async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toPost(registerUserUrl(), body: {
      'nickname': nickname,
      'name': name,
      'last_name': lastName,
      'profile_image': null,
      'password': password,
      'password2': password2,
    });
    log('Register statusMessage ======= ${response.statusMessage}');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      RegisterModel userDataModel = RegisterModel.fromJson(response.data);
      log('Register response ======= ${response.data}');

      return userDataModel;
    } else {
      throw ServerException();
    }
  }
}
