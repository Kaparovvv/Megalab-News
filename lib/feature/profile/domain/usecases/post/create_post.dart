import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/create_post_entity.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/post/create_post_repos.dart';

class CreatePost extends UseCase<CreatePostEntity, CreatePostParams> {
  final CreatePostRepository createPostRepository;

  CreatePost(this.createPostRepository);

  @override
  Future<Either<Failure, CreatePostEntity>> call(
    CreatePostParams params,
  ) async {
    return await createPostRepository.createPost(
      params.title,
      params.text,
      params.image,
      params.tag,
      params.shortDesc,
    );
  }
}

class CreatePostParams extends Equatable {
  final String title;
  final String text;
  final File? image;
  final String tag;
  final String shortDesc;

  const CreatePostParams({
    required this.title,
    required this.text,
    required this.image,
    required this.tag,
    required this.shortDesc,
  });
  @override
  List<Object?> get props => [
        title,
        text,
        image,
        tag,
        shortDesc,
      ];
}
