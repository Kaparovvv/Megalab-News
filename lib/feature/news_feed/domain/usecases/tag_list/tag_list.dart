import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/core/usecases/usecases.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/tag_list_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/tag_list_repository.dart';

class TagList extends UseCase<List<TagListEntity>, TagListParams> {
  final TagListRepository tagListRepository;

  TagList(this.tagListRepository);

  @override
  Future<Either<Failure, List<TagListEntity>>> call(
      TagListParams params) async {
    return await tagListRepository.getTagList();
  }
}

class TagListParams extends Equatable {
  @override
  List<Object?> get props => [];
}
