import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/create_post_entity.dart';

abstract class CreatePostRepository {
  Future<Either<Failure, CreatePostEntity>> createPost(
    String title,
    String text,
    File? image,
    String tag,
    String shortDesc,
  );
}
