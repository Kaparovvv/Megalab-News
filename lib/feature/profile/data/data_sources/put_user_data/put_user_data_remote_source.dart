import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/profile/data/models/user_data_model.dart';

abstract class PutUserDataRemoteSource {
  Future<UserDataModel> putUserData(
    String nickname,
    String name,
    String lastname,
    File? profileImage,
  );
}

class PutUserDataRemoteSourceImpl implements PutUserDataRemoteSource {
  FormData formData = FormData();

  @override
  Future<UserDataModel> putUserData(
    String nickname,
    String name,
    String lastname,
    File? profileImage,
  ) async {
    if (profileImage != null) {
      String imageFile = profileImage.path.split('/').last;
      formData = FormData.fromMap({
        "nickname": nickname,
        "name": name,
        "last_name": lastname,
        "profile_image":
            await MultipartFile.fromFile(profileImage.path, filename: imageFile)
      });
    } else {
      formData = FormData.fromMap({
        "nickname": nickname,
        "name": name,
        "last_name": lastname,
        "profile_image": '',
      });
    }

    ApiRequester requester = ApiRequester();
    Response response = await requester.toPut(
      putUserDataUrl(),
      isToken: true,
      formData: formData,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Put User Data ==== ${response.statusCode}');
      log('Put User Data response ==== ${response.data}');

      UserDataModel userDataModel = UserDataModel.fromJson(response.data);
      return userDataModel;
    } else {
      throw ServerException();
    }
  }
}
