import 'dart:io';

import 'package:megalab_news_app/core/error/exception.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/profile/data/data_sources/post/create_post_remote_source.dart';
import 'package:megalab_news_app/feature/profile/data/models/create_post_model.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/create_post_entity.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/post/create_post_repos.dart';

class CreatePostReposExt extends CreatePostRepository {
  final CreatePostRemoteSource remoteDataSource;
  final NetworkInfo networkInfo;

  CreatePostReposExt({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CreatePostEntity>> createPost(
    String title,
    String text,
    File? image,
    String tag,
    String shortDesc,
  ) async {
    return await _createPostSourse(
      () => remoteDataSource.createPost(
        title,
        text,
        image,
        tag,
        shortDesc,
      ),
    );
  }

  Future<Either<Failure, CreatePostEntity>> _createPostSourse(
    Future<CreatePostModel> Function() createPost,
  ) async {
    try {
      final createPostData = await createPost();
      return Right(createPostData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
