import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/error/catch_exception.dart';

class ApiRequester {
  static const String url = 'https://megalab.pythonanywhere.com/';

  Future<Dio> initDio() async {
    // String token = await tokenBox.get("token", defaultValue: '');
    // String token = '';
    // log('Token_apiRequester === $token');
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        headers: {
          "Authorization": 'Token 8ef696edf0104d6d9a15104afc9d89a600515f31'
        },
        connectTimeout: 30000,
      ),
    );
  }

  Future<Response> toGet(
    String url, {
    Map<String, dynamic>? queryParam,
  }) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: queryParam);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(
    String url, {
    Map<String, dynamic>? param,
    required Map<String, dynamic> body,
  }) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, queryParameters: param, data: body);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPatch(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.patch(url, queryParameters: param, data: body);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toDelete(String url) async {
    Dio dio = await initDio();
    try {
      return dio.delete(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
