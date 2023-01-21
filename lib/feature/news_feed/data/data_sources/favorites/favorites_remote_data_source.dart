import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:megalab_news_app/api/api_requester/api_requester.dart';
import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/urls/urls.dart';
import 'package:megalab_news_app/feature/news_feed/data/models/post_model.dart';

import '../../models/favorites_model.dart';

abstract class FavoritesRemoteDataSource {
  Future<FavoritesModel> toFavorites(int postId);
  Future<FavoritesModel> fromFavorites(int postId);
  Future<List<PostModel>> getFavorites();
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  ApiRequester requester = ApiRequester();
  @override
  Future<FavoritesModel> fromFavorites(int postId) async {
    Response response = await requester.toPost(
      favoritesUrl(),
      isToken: true,
      body: {"post": postId},
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Delete from  favorites ======= ${response.statusMessage}');

      FavoritesModel favoritesModel = FavoritesModel.fromJson(response.data);
      return favoritesModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FavoritesModel> toFavorites(int postId) async {
    Response response = await requester.toPost(
      favoritesUrl(),
      isToken: true,
      body: {"post": postId},
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Add to favorites ======= ${response.statusMessage}');
      FavoritesModel favoritesModel = FavoritesModel.fromJson(response.data);
      return favoritesModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PostModel>> getFavorites() async {
    Response response = await requester.toGet(
      favoritesUrl(),
      isToken: true,
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      log('Get Favorites List statusMessage ======= ${response.statusMessage}');
      List<PostModel> favoritesModel =
          response.data.map<PostModel>((el) => PostModel.fromJson(el)).toList();
      return favoritesModel;
    } else {
      throw ServerException();
    }
  }
}
