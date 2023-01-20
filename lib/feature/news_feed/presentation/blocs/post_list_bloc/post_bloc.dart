import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/core/error/failure_to_message.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/post_detail.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/post_list.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostList postList;
  final PostDetail postDetail;
  PostBloc({
    required this.postList,
    required this.postDetail,
  }) : super(PostInitial()) {
    on<GetPostListEvent>((event, emit) async {
      emit(LoadingPostListState());
      final result = await postList(
        const PostListParams(
          search: '',
          tag: '',
          author: '',
        ),
      );

      result.fold(
        (failure) => emit(
          ErrorPostListState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (postList) => emit(
          LoadedPostListState(postList: postList),
        ),
      );
    });
  }
}
