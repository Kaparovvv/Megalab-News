import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/cached_network_image_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/local_widgets/user_comment_field_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/state_blocs/cubit_commenting/commenting_cubit.dart';

class CommentDataWidget extends StatelessWidget {
  final String? userImage;
  final String? userComment;
  final String? commentText;
  final double? leftPadding;
  final int postId;
  final int parent;
  const CommentDataWidget({
    super.key,
    this.userImage,
    this.userComment,
    this.commentText,
    this.leftPadding,
    required this.postId,
    required this.parent,
  });

  @override
  Widget build(BuildContext context) {
    var commentingCubit = context.read<CommentingCubit>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftPadding ?? 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 25.w,
                    height: 25.h,
                    child: CachedNetworkImageWidget(
                      imageUrl: userImage,
                      width: double.infinity,
                      height: double.infinity,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    userComment ?? 'User',
                    style: TextStyleHelper.f18w500,
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              Text(
                commentText ?? 'Comment text',
                style: TextStyleHelper.f16w400,
              ),
              SizedBox(height: 7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    dateFormatter(),
                    style: TextStyleHelper.f16w400,
                  ),
                  SizedBox(width: 30.w),
                  CustomTextButtonWidget(
                    onPressed: () => commentingCubit.replyToTheComment(),
                    text: 'Ответить',
                    textStyle: TextStyleHelper.f16w400.copyWith(
                      color: ThemeHelper.color7E5BC2,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        BlocBuilder<CommentingCubit, CommentingState>(
          builder: (context, state) {
            if (state is ReplyToTheCommentState) {
              return UserCommentFieldWidget(postId: postId, parent: parent);
            }
            if (state is CancelReplyToComment) {
              return const SizedBox();
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }

  String dateFormatter() {
    var now = DateTime.now();
    var formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(now);
  }
}
