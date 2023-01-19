import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/error/catch_exception.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiRequester {
  static const String url = 'https://megalab.pythonanywhere.com/';
  static const CACHER_USER_TOKEN = 'CACHER_USER_TOKEN';

  Future<Dio> initDio({bool? isToken}) async {
    log('User Token =========== ${getIt.get<SharedPreferences>().getString(CACHER_USER_TOKEN)}');
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        headers: isToken ?? false
            ? {
                "Authorization":
                    'Token ${getIt.get<SharedPreferences>().getString(CACHER_USER_TOKEN)}'
              }
            : {},
        connectTimeout: 30000,
      ),
    );
  }

  Future<Response> toGet(
    String url, {
    bool? isToken,
    Map<String, dynamic>? queryParam,
  }) async {
    Dio dio = await initDio(isToken: isToken);
    try {
      return dio.get(url, queryParameters: queryParam);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(
    String url, {
    bool? isToken,
    Map<String, dynamic>? param,
    required Map<String, dynamic> body,
  }) async {
    Dio dio = await initDio(isToken: isToken);
    try {
      return dio.post(url, queryParameters: param, data: body);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPatch(
    String url, {
    bool? isToken,
    Map<String, dynamic>? param,
    required Map<String, dynamic> body,
  }) async {
    Dio dio = await initDio(isToken: isToken);
    try {
      return dio.patch(url, queryParameters: param, data: body);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toDelete(
    String url, {
    bool? isToken,
  }) async {
    Dio dio = await initDio(isToken: isToken);
    try {
      return dio.delete(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
