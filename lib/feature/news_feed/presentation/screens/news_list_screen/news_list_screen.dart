import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/btn_try_again_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_snackbar.dart';
import 'package:megalab_news_app/core/global_widgets/loading_overlay_widget.dart';
import 'package:megalab_news_app/core/global_widgets/pop_up_search_field.dart';
import 'package:megalab_news_app/core/global_widgets/refresh_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_divider_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/news_sliver_appbar_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/filtering_dialog_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/news_publication_widget.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late TextEditingController _searchController;
  ScrollController? _scrollController;
  late PostBloc _postBloc;
  late TagListBloc _tagListBloc;

  List<String> listOfTag = [];

  @override
  void initState() {
    _postBloc = BlocProvider.of(context);
    _tagListBloc = BlocProvider.of(context);
    _postBloc.add(GetPostListEvent());
    _tagListBloc.add(GetTagListEvent());
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BlocConsumer<PostBloc, PostState>(
              bloc: _postBloc,
              listener: (context, state) {
                if (state is ErrorPostListState) {
                  showCustomSnackBar(context, state.message);
                }
                if (state is LoadedPostListState) {
                  listOfTag.clear();
                  _searchController.clear();
                }
              },
              builder: (context, state) {
                if (state is LoadedPostListState) {
                  return RefreshIndicatorWidget(
                    edgeOffset: 163.h,
                    onRefresh: () async => _postBloc.add(
                      GetPostListEvent(),
                    ),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        NewsSliverAppBarWidget(
                          scrollController: _scrollController!,
                          isSearchButton: true,
                          onSearch: () => showDialog(
                            context: context,
                            builder: (context) => PopUpSearchField(
                              controller: _searchController,
                              onPressed: () {
                                if (_searchController.text.isNotEmpty) {
                                  _postBloc.add(
                                    GetPostListByQueryEvent(
                                      query: _searchController.text,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
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
                                  builder: (context) => FilteringDialogWidget(
                                    listOfTag: listOfTag,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        state.postList.isNotEmpty
                            ? SliverList(
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
                                          if (index !=
                                              (state.postList.length - 1))
                                            const CustomDividerWidget(),
                                        ],
                                      ),
                                    );
                                  },
                                  childCount: state.postList.length,
                                ),
                              )
                            : SliverToBoxAdapter(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 250),
                                  child: Center(
                                    child: Text(
                                      'Здесь пока ничего нет',
                                      style: TextStyleHelper.f16w400,
                                    ),
                                  ),
                                ),
                              ),
                        SliverToBoxAdapter(
                          child: BottomPanelWidget(
                            firstButton: 'Мой профиль',
                            firstRoute: () => context.router.push(
                              const ProfileScreenRoute(),
                            ),
                            secondButton: 'Избранные новости',
                            secondRoute: () => context.router.push(
                              const SelectedNewsScreenRoute(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is LoadingPostListState) {
                  return const LoadingOverlayWidget();
                }
                return ButtonTryAgainWidget(
                  onPressed: () => _postBloc.add(GetPostListEvent()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
