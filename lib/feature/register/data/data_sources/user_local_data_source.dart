import 'package:hive_flutter/hive_flutter.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/feature/register/data/models/user_data_model.dart';

abstract class UserLocalDataSource {
  Future<UserDataModel> getUserDataFromCache();
  Future<void> userDataToCache(UserDataModel userDataModel);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static String userDataKey = 'userData';
  Box<UserDataModel> userDataBox = Hive.box('userDataBox');

  @override
  Future<UserDataModel> getUserDataFromCache() {
    final jsonUserData = userDataBox.get(userDataKey);

    if (userDataBox.isNotEmpty) {
      print('Get UserData from Cache: $jsonUserData');
      return Future.value(jsonUserData);
    } else {
      throw CacheException();
    }
  }

  @override
  Future userDataToCache(UserDataModel userDataModel) {
    final UserDataModel jsonUserData = userDataModel;
    userDataBox.put(userDataKey, jsonUserData);
    print('UserData to write Cache: $jsonUserData');

    return Future.value(jsonUserData);
  }
}
