import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'commenting_state.dart';

class CommentingCubit extends Cubit<CommentingState> {
  CommentingCubit() : super(CommentingInitial());

  replyToTheComment() => emit(ReplyToTheCommentState());
  cancelReply() => emit(CancelReplyToComment());
}
