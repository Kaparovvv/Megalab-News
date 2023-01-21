import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/btn_try_again_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_overlay_widget.dart';
import 'package:megalab_news_app/core/global_widgets/news_sliver_appbar_widget.dart';
import 'package:megalab_news_app/core/global_widgets/refresh_indicator_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/comment_bloc/comment_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/post_detail_bloc/post_detail_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/news_publication_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/local_widgets/comment_list_widget.dart';

class NewsScreen extends StatefulWidget {
  final int postId;
  const NewsScreen({super.key, required this.postId});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  TextEditingController commentController = TextEditingController();
  ScrollController? _scrollController;
  late PostDetailBloc _postDetailBloc;
  late CommentBloc _commentBloc;

  @override
  void initState() {
    _postDetailBloc = BlocProvider.of(context, listen: false);
    _commentBloc = BlocProvider.of(context, listen: false);
    _postDetailBloc.add(GetPostDetailEvent(postId: widget.postId));
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var postId = widget.postId;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocConsumer<PostDetailBloc, PostDetailState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ErrorPostDetailState) {
                  return ButtonTryAgainWidget(
                    onPressed: () => _postDetailBloc.add(
                      GetPostDetailEvent(postId: postId),
                    ),
                  );
                }
                if (state is LoadingPostDetailState) {
                  return const LoadingOverlayWidget();
                }
                if (state is LoadedPostDetailState) {
                  var postDetail = state.postDetail;
                  return RefreshIndicatorWidget(
                    edgeOffset: 163.h,
                    onRefresh: () async => _postDetailBloc.add(
                      GetPostDetailEvent(postId: postId),
                    ),
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
                                  postData: postDetail,
                                  isExtended: true,
                                ),
                                SizedBox(height: 35.h),
                                Text('Комментарии',
                                    style: TextStyleHelper.f24w500),
                              ],
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              var commentList = postDetail.comment![index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 20.w,
                                  right: 20.w,
                                  bottom: 24.h,
                                ),
                                child: CommentListWidget(
                                  commentData: commentList,
                                  postId: postId,
                                ),
                              );
                            },
                            childCount: postDetail.comment!.length,
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
                                  constraints: BoxConstraints(
                                    maxHeight: 38.h,
                                    maxWidth: 230.w,
                                  ),
                                  hinText: 'Напишите комментарий',
                                  controller: commentController,
                                ),
                                BlocConsumer<CommentBloc, CommentState>(
                                  bloc: _commentBloc,
                                  listener: (context, state) {
                                    if (state is LoadedCommentToPostState) {
                                      _postDetailBloc.add(
                                        GetPostDetailEvent(
                                            postId: widget.postId),
                                      );
                                      commentController.clear();
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is LoadingCommentToPostState) {
                                      return const LoadingIndicatorWidget(
                                        size: 30,
                                      );
                                    }
                                    return CustomButtonWidget(
                                      onPressed: () => _commentBloc.add(
                                        CommentToPostEvent(
                                          postId: postId,
                                          text: commentController.text,
                                        ),
                                      ),
                                      width: 37,
                                      height: 38,
                                      isChildText: false,
                                      iconUrl: IconHelper.arrowUp,
                                    );
                                  },
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
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
