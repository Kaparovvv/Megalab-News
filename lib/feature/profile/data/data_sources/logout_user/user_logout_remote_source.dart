import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/profile/data/models/user_logout_model.dart';

abstract class UserLogoutRemoteSource {
  Future<UserLogoutModel> userLogout();
}

class UserLogoutRemoteSourceImpl implements UserLogoutRemoteSource {
  @override
  Future<UserLogoutModel> userLogout() async {
    ApiRequester requester = ApiRequester();
    Response response = await requester.toGet(
      userLogoutUrl(),
      isToken: true,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      UserLogoutModel logoutModel = const UserLogoutModel(isLogout: true);
      return logoutModel;
    } else {
      throw ServerException();
    }
  }
}
