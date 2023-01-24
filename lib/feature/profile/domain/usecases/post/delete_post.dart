import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/delete_post_entity.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/post/delete_post_repos.dart';

import '../../../../../core/usecases/usecases.dart';

class DeletePost extends UseCase<DeletePostEntity, DeletePostParams> {
  final DeletePostRepository deletePostRepository;

  DeletePost(this.deletePostRepository);
  @override
  Future<Either<Failure, DeletePostEntity>> call(
      DeletePostParams params) async {
    return await deletePostRepository.deletePost(params.postId);
  }
}

class DeletePostParams extends Equatable {
  final int postId;

  const DeletePostParams({required this.postId});
  @override
  List<Object?> get props => [postId];
}
