import 'package:flutter/material.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_entity.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/local_widgets/commenting_provider_widget.dart';

class CommentListWidget extends StatefulWidget {
  final Comment? commentData;
  const CommentListWidget({
    super.key,
    required this.commentData,
  });

  @override
  State<CommentListWidget> createState() => _CommentListWidgetState();
}

class _CommentListWidgetState extends State<CommentListWidget> {
  @override
  Widget build(BuildContext context) {
    var commentData = widget.commentData;
    return Column(
      children: [
        CommentingProvider(
          userImage: commentData!.user!.profileImage,
          userComment: commentData.user!.nickname,
          commentText: commentData.text,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: commentData.child!.length,
          itemBuilder: (context, index) {
            var commentChild = commentData.child![index];
            return CommentingProvider(
              userImage: commentChild!.user!.profileImage,
              userComment: commentData.user!.nickname,
              commentText: commentData.text,
              leftPadding: 32,
            );
          },
        ),
      ],
    );
  }
}
