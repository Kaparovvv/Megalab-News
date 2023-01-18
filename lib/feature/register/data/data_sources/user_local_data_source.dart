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
    // final userDataModel = UserDataModel(
    //   id: userDataBox.get('id'),
    //   name: userDataBox.get('name'),
    //   lastName: userDataBox.get('lastName'),
    //   nickname: userDataBox.get('nickName'),
    // );

    // if (userDataBox.isNotEmpty) {
    //   print('Get UserData from Cache: ${userDataBox.length}');
    //   return Future.value(userDataModel);
    // } else {
    //   throw CacheException();
    // }
  }

  @override
  Future<void> userDataToCache(UserDataModel userDataModel) {
    return sharedPreferences.setString(
      CACHED_USER_DATA,
      json.encode(
        userDataModel.toJson(),
      ),
    );
    // final String id = userDataModel.id.toString();
    // final String name = userDataModel.name;
    // final String lastName = userDataModel.lastName;
    // final String nickName = userDataModel.nickname;

    // sharedPreferences.setString('id', id);
    // sharedPreferences.setString('name', name);
    // sharedPreferences.setString('lastName', lastName);
    // sharedPreferences.setString('nickname', nickName);

    // return Future.value();

    // await userDataBox.put('id', userDataModel.id);
    // await userDataBox.put('nickName', userDataModel.nickname);
    // await userDataBox.put('name', userDataModel.name);
    // await userDataBox.put('lastName', userDataModel.lastName);
    // return Future.value(userDataBox);
    // print(
    //     '${userData.id},\n${userData.nickname},\n${userData.name},\n${userData.lastName},\n');
    // await userData.delete();
    // print(
    //     '${userData.id},\n${userData.nickname},\n${userData.name},\n${userData.lastName},\n');

    // if (userDataBox.isEmpty) {
    //   userData.id = userDataModel.id;
    //   userData.nickname = userDataModel.nickname;
    //   userData.name = userDataModel.name;
    //   userData.lastName = userDataModel.lastName;

    //   userDataBox.add(userData);
    // }
  }
}
