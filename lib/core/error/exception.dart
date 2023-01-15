import 'package:dio/dio.dart';

class ServerException implements Exception {
  String? message;
  ServerException({this.message});
  static ServerException convertException(dynamic error) {
    if (error is DioError && error.error is ServerException) {
      return error.error;
    }
    if (error is DioError) {
      if (error.type == DioErrorType.connectTimeout) {
        return ServerException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.type == DioErrorType.receiveTimeout) {
        return ServerException(
            message: 'Привышено время обработки запроса. Повторите позднее');
      } else if (error.response == null) {
        return ServerException(message: 'Нет интернет соеденения');
      } else if (error.response!.statusCode == 409) {
        // return ServerException(message: error.response!.data["message"]);
        return ServerException(
            message: 'Пользователь с таким email уже существует');
      } else if (error.response!.statusCode == 401) {
        return ServerException(message: error.response!.data["message"]);
      } else {
        return ServerException(message: 'Произошла системаная ошибка');
      }
    }
    if (error is ServerException) {
      return error;
    } else {
      return ServerException(message: 'Произошла системаная ошибка');
    }
  }

  @override
  String toString() {
    return 'message: $message';
  }
}

class CacheException implements Exception {}
