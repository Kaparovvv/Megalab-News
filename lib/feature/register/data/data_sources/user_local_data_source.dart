import 'dart:convert';

import 'package:megalab_news_app/commons/names_helper.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/register/data/models/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<RegisterModel> getUserDataFromCache();
  Future<void> userDataToCache(RegisterModel registerModel);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<RegisterModel> getUserDataFromCache() {
    final jsonUserData =
        sharedPreferences.getString(NamesHelper.cachedResponseData);
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
      NamesHelper.cachedResponseData,
      json.encode(
        registerModel.toJson(),
      ),
    );
  }
}
