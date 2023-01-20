import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/local_widgets/comment_data_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/state_blocs/cubit/commenting_cubit.dart';

class CommentingProvider extends StatelessWidget {
  final String? userImage;
  final String? userComment;
  final String? commentText;
  final double? leftPadding;
  const CommentingProvider({
    super.key,
    this.userImage,
    this.userComment,
    this.commentText,
    this.leftPadding,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentingCubit(),
      child: CommentDataWidget(
        userImage: userImage,
        userComment: userComment,
        commentText: commentText,
        leftPadding: leftPadding,
      ),
    );
  }
}
