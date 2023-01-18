import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';

abstract class PostListRepository {
  Future<Either<Failure, UserEntity>> getPostList();
}
