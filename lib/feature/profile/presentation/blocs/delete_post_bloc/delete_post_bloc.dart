import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/profile/domain/entities/delete_post_entity.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

import '../../../../../utils/dependencies_export.dart';

part 'delete_post_event.dart';
part 'delete_post_state.dart';

class DeletePostBloc extends Bloc<DeletePostEvent, DeletePostState> {
  final DeletePost deletePost;
  DeletePostBloc({required this.deletePost}) : super(DeletePostInitial()) {
    on<DeleteNewsPostEvent>((event, emit) async {
      emit(LoadingDeletePostState());
      final result = await deletePost(
        DeletePostParams(postId: event.postId),
      );

      result.fold(
        (failure) => emit(
          ErrorDeletePostState(
            message: getIt.get<FailureToMessage>().mapFailureToMessage(failure),
          ),
        ),
        (deletePost) => emit(
          LoadedDeletePostState(deletePostEntity: deletePost),
        ),
      );
    });
  }
}
