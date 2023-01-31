import 'dart:convert';

import 'package:megalab_news_app/commons/names_helper.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/profile/data/models/user_data_model.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

abstract class UserDataLocalSource {
  Future<UserDataModel> getUserDataFromCache();
  Future<void> userDataToCache(UserDataModel userDataModel);
}

class UserDataLocalSourceImpl implements UserDataLocalSource {
  final SharedPreferences sharedPreferences;

  const UserDataLocalSourceImpl({required this.sharedPreferences});

  @override
  Future<UserDataModel> getUserDataFromCache() {
    final jsonUserData =
        sharedPreferences.getString(NamesHelper.cachedUserData);
    if (jsonUserData!.isNotEmpty) {
      return Future.value(
        UserDataModel.fromJson(
          jsonDecode(jsonUserData),
        ),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> userDataToCache(UserDataModel userDataModel) {
    return sharedPreferences.setString(
      NamesHelper.cachedUserData,
      json.encode(
        userDataModel.toJson(),
      ),
    );
  }
}
