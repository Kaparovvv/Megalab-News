import 'dart:convert';

import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/register/data/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<RegisterModel> getUserDataFromCache();
  Future<void> userDataToCache(RegisterModel registerModel);
}

const CACHED_RESPONSE_DATA = 'CACHED_RESPONSE_DATA';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<RegisterModel> getUserDataFromCache() {
    final jsonUserData = sharedPreferences.getString(CACHED_RESPONSE_DATA);
    if (jsonUserData!.isNotEmpty) {
      return Future.value(
        RegisterModel.fromJson(
          json.decode(jsonUserData),
        ),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> userDataToCache(RegisterModel registerModel) {
    return sharedPreferences.setString(
      CACHED_RESPONSE_DATA,
      json.encode(
        registerModel.toJson(),
      ),
    );
  }
}
