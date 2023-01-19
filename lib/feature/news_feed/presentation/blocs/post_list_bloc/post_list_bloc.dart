import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:megalab_news_app/core/error/failure_to_message.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/post_list.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PostList postList;
  PostListBloc({required this.postList}) : super(PostListInitial()) {
    on<PostListEvent>((event, emit) async {
      if (event is GetPostListEvent) {
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
              message:
                  getIt.get<FailureToMessage>().mapFailureToMessage(failure),
            ),
          ),
          (postList) => emit(
            LoadedPostListState(postList: postList),
          ),
        );
      }
    });
  }
}
