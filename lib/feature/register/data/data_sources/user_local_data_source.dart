import 'dart:convert';

import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/register/data/models/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<UserDataModel> getUserDataFromCache();
  Future<void> userDataToCache(UserDataModel userDataModel);
}

const CACHED_USER_DATA = 'CACHED_USER_DATA';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserDataModel> getUserDataFromCache() {
    final jsonUserData = sharedPreferences.getString(CACHED_USER_DATA);
    if (jsonUserData!.isNotEmpty) {
      return Future.value(UserDataModel.fromJson(json.decode(jsonUserData)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> userDataToCache(UserDataModel userDataModel) {
    return sharedPreferences.setString(
      CACHED_USER_DATA,
      json.encode(
        userDataModel.toJson(),
      ),
    );
  }
}
