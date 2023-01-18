import 'dart:convert';
import 'dart:developer';

import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/auth/data/models/user_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserTokenLocalDataSource {
  Future<UserTokenModel> getUserTokenFromCache();
  Future<void> userTokenToCache(UserTokenModel userTokenModel);
}

const CACHER_USER_TOKEN = 'CACHER_USER_TOKEN';

class UserTokenLocalDataSourceImpl implements UserTokenLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserTokenLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserTokenModel> getUserTokenFromCache() {
    final jsonUserToken = sharedPreferences.getString(CACHER_USER_TOKEN);
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
      CACHER_USER_TOKEN,
      json.encode(userTokenModel.toJson()),
    );
  }
}
