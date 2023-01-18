import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/auth/data/models/user_token_model.dart';

abstract class UserTokenRemoteDataSource {
  Future<UserTokenModel> authUser(
    String nickname,
    String password,
  );
}

class UserTokenRemoteDataSourceImpl implements UserTokenRemoteDataSource {
  @override
  Future<UserTokenModel> authUser(
    String nickname,
    String password,
  ) async {
    print('nickname ===== $nickname');
    print('password ===== $password');

    ApiRequester requester = ApiRequester();
    Response response = await requester.toPost(authUserUrl(), body: {
      "nickname": nickname,
      "password": password,
    });

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Auth response ===== ${response.statusCode}');
      UserTokenModel tokenModel = UserTokenModel.fromJson(response.data);
      log('Auth response ======= ${response.data}');

      return tokenModel;
    } else {
      throw ServerException();
    }
  }
}
