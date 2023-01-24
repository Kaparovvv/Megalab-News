import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/delete_post_entity.dart';

import '../../../../../core/error/failure.dart';

abstract class DeletePostRepository {
  Future<Either<Failure, DeletePostEntity>> deletePost(int postId);
}
