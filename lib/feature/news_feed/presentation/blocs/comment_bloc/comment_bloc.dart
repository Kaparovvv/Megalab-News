import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/core/error/failure_to_message.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/comment_entity.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/comment/comment_to_comment.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/comment/comment_to_post.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentToPost commentToPost;
  final CommentToComment commentToComment;
  CommentBloc({
    required this.commentToComment,
    required this.commentToPost,
  }) : super(CommentInitial()) {
    on<CommentToPostEvent>((event, emit) async {
      emit(LoadingCommentToPostState());
      final result = await commentToPost(
        CommentToPostParams(
          postId: event.postId,
          text: event.text,
        ),
      );

      result.fold(
        (failure) => emit(
          ErrorCommentToPostState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (commenData) => emit(
          LoadedCommentToPostState(commentEntity: commenData),
        ),
      );
    });

    on<CommentToCommentEvent>((event, emit) async {
      emit(LoadingCommentToCommentState());
      final result = await commentToComment(
        CommentToCommentParams(
          postId: event.postId,
          text: event.text,
          parent: event.parent,
        ),
      );

      result.fold(
        (failure) => emit(
          ErrorCommentToCommentState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (commenData) => emit(
          LoadedCommentToCommentState(commentEntity: commenData),
        ),
      );
    });
  }
}
