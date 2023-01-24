import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/tag_list_entity.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

import '../../../../../utils/dependencies_export.dart';

part 'tag_list_event.dart';
part 'tag_list_state.dart';

class TagListBloc extends Bloc<TagListEvent, TagListState> {
  final TagList tagList;
  TagListBloc({required this.tagList}) : super(TagListInitial()) {
    on<GetTagListEvent>((event, emit) async {
      emit(LoadingTagListState());
      final result = await tagList(TagListParams());

      result.fold(
        (failure) => emit(ErrorTagListState(
          message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
        )),
        (tagList) => emit(LoadedTagListState(tagList: tagList)),
      );
    });
  }
}
