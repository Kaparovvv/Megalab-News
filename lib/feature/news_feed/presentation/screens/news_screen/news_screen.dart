import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/cached_network_image_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';
import 'package:megalab_news_app/core/global_widgets/news_sliver_appbar_widget.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/news_publication_widget.dart';

class NewsScreen extends StatefulWidget {
  final PostListEntity postData;
  const NewsScreen({super.key, required this.postData});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            NewsSliverAppBarWidget(
              scrollController: _scrollController!,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 24.h,
                  right: 20.w,
                  bottom: 35.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewsPublicationWidget(
                      postData: widget.postData,
                      isExtended: true,
                    ),
                    SizedBox(height: 35.h),
                    Text('Комментарии', style: TextStyleHelper.f24w500),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var commentList = widget.postData.comment![index];
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 24.h),
                    child: CommentDataWidget(
                      userImage: commentList!.user!.profileImage,
                      userComment: commentList.user!.nickname,
                      commentText: commentList.text,
                    ),
                  );
                },
                childCount: widget.postData.comment!.length,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 24.h,
                  left: 20.w,
                  bottom: 58.h,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFieldWidget(
                      width: 230.r,
                      height: 38.r,
                      hinText: 'Напишите комментарий',
                      controller: TextEditingController(),
                    ),
                    CustomButtonWidget(
                      onPressed: () {},
                      width: 37,
                      height: 38,
                      isChildText: false,
                      iconUrl: IconHelper.arrowUp,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: BottomPanelWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentDataWidget extends StatelessWidget {
  final String? userImage;
  final String? userComment;
  final String? commentText;
  const CommentDataWidget({
    super.key,
    required this.userImage,
    required this.userComment,
    required this.commentText,
  });

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('dd.MM.yyyy');
    String formattedDate = formatter.format(now);
    return Column(
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
              formattedDate.toString(),
              style: TextStyleHelper.f16w400,
            ),
            SizedBox(width: 30.w),
            CustomTextButtonWidget(
              onPressed: () {},
              text: 'Ответить',
              textStyle: TextStyleHelper.f16w400.copyWith(
                color: ThemeHelper.color7E5BC2,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'Вы',
        //       style: TextStyleHelper.f18w500,
        //     ),
        //     CustomTextFieldWidget(
        //       width: 198.w,
        //       height: 27.h,
        //       controller: TextEditingController(),
        //       maxLines: 20,
        //     ),
        //     CustomButtonWidget(
        //       onPressed: () {
        //         var width = MediaQuery.of(context).size.width;
        //         log(width.toString());
        //       },
        //       width: 37,
        //       height: 27,
        //       isChildText: false,
        //       iconUrl: IconHelper.arrowUp,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
