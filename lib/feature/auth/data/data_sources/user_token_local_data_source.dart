import 'dart:convert';
import 'dart:developer';

import 'package:megalab_news_app/commons/names_helper.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/auth/data/models/user_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserTokenLocalDataSource {
  Future<UserTokenModel> getUserTokenFromCache();
  Future<void> userTokenToCache(UserTokenModel userTokenModel);
}

class UserTokenLocalDataSourceImpl implements UserTokenLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserTokenLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserTokenModel> getUserTokenFromCache() {
    final jsonUserToken =
        sharedPreferences.getString(NamesHelper.cacheUserToken);
    if (jsonUserToken!.isNotEmpty) {
      log(jsonUserToken.toString());
      return Future.value(
        UserTokenModel.fromJson(json.decode(jsonUserToken)),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> userTokenToCache(UserTokenModel userTokenModel) {
    return sharedPreferences.setString(
        NamesHelper.cacheUserToken, userTokenModel.token);
  }
}
