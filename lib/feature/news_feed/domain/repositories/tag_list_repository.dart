import 'package:dartz/dartz.dart';
import 'package:megalab_news_app/core/error/failure.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/tag_list_entity.dart';

abstract class TagListRepository {
  Future<Either<Failure, List<TagListEntity>>> getTagList();
}
