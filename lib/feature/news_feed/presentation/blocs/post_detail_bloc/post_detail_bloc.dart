import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/core/error/failure_to_message.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/post/post_detail.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostDetail postDetail;
  PostDetailBloc({required this.postDetail}) : super(PostDetailInitial()) {
    on<GetPostDetailEvent>((event, emit) async {
      emit(LoadingPostDetailState());
      final result = await postDetail(
        PostDetailParams(postId: event.postId),
      );

      result.fold(
        (failure) => emit(
          ErrorPostDetailState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (postDetail) => emit(
          LoadedPostDetailState(postDetail: postDetail),
        ),
      );
    });
  }
}
