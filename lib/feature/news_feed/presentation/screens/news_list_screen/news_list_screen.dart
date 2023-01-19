import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_overlay_widget.dart';
import 'package:megalab_news_app/core/global_widgets/refresh_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_divider_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/news_sliver_appbar_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/post_list_bloc/post_list_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/filtering_dialog_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/news_publication_widget.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  ScrollController? _scrollController;
  late PostListBloc _postListBloc;

  @override
  void initState() {
    _postListBloc = BlocProvider.of(context, listen: false);
    _postListBloc.add(GetPostListEvent());
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocConsumer<PostListBloc, PostListState>(
              bloc: _postListBloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadedPostListState) {
                  return RefreshIndicatorWidget(
                    edgeOffset: 163.h,
                    onRefresh: () async => _postListBloc.add(
                      GetPostListEvent(),
                    ),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        NewsSliverAppBarWidget(
                          scrollController: _scrollController!,
                        ),
                        SliverToBoxAdapter(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 20.w, top: 16.h),
                              child: CustomIconButtonWidget(
                                iconUrl: IconHelper.filter,
                                color: ThemeHelper.black,
                                size: 24,
                                onPressed: () => showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const FilteringDialogWidget(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              var post = state.postList[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: 21.h,
                                  left: 20.w,
                                  right: 23.w,
                                ),
                                child: Column(
                                  children: [
                                    NewsPublicationWidget(
                                      postData: post,
                                      isExtended: false,
                                    ),
                                    SizedBox(height: 24.h),
                                    if (index != (state.postList.length - 1))
                                      const CustomDividerWidget(),
                                  ],
                                ),
                              );
                            },
                            childCount: state.postList.length,
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: BottomPanelWidget(),
                        ),
                      ],
                    ),
                  );
                }
                if (state is LoadingPostListState) {
                  return const LoadingOverlayWidget();
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
