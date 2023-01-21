import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/comment_bloc/comment_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/post_detail_bloc/post_detail_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/state_blocs/cubit/commenting_cubit.dart';

class UserCommentFieldWidget extends StatelessWidget {
  final int postId;
  final int parent;
  const UserCommentFieldWidget({
    Key? key,
    required this.postId,
    required this.parent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Вы',
          style: TextStyleHelper.f18w500,
        ),
        CustomTextFieldWidget(
          constraints: BoxConstraints(maxHeight: 27.h, maxWidth: 198.w),
          controller: commentController,
        ),
        BlocConsumer<CommentBloc, CommentState>(
          bloc: BlocProvider.of<CommentBloc>(context),
          listener: (context, state) {
            if (state is LoadedCommentToCommentState) {
              context.read<PostDetailBloc>().add(
                    GetPostDetailEvent(postId: postId),
                  );
              commentController.clear();
              context.read<CommentingCubit>().cancelReply();
            }
          },
          builder: (context, state) {
            if (state is LoadingCommentToCommentState) {
              return const LoadingIndicatorWidget(size: 30);
            }
            return CustomButtonWidget(
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  context.read<CommentBloc>().add(
                        CommentToCommentEvent(
                          postId: postId,
                          text: commentController.text,
                          parent: parent,
                        ),
                      );
                } else {
                  context.read<CommentingCubit>().cancelReply();
                }
              },
              width: 37,
              height: 27,
              isChildText: false,
              iconUrl: IconHelper.arrowUp,
            );
          },
        ),
      ],
    );
  }
}
