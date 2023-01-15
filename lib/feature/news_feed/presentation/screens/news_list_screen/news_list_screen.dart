import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_divider_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/news_sliver_appbar_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_list_screen/local_widgets/filtering_dialog_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_list_screen/local_widgets/news_publication_widget.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count = 5;
    return Scaffold(
      body: SafeArea(
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
                      builder: (context) => const FilteringDialogWidget(),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(top: 21.h, left: 20.w, right: 23.w),
                    child: Column(
                      children: [
                        NewsPublicationWidget(
                          onPressed: () => context.router.push(
                            const NewsScreenRoute(),
                          ),
                          isExtended: false,
                        ),
                        SizedBox(height: 24.h),
                        if (index != (count - 1)) const CustomDividerWidget(),
                      ],
                    ),
                  );
                },
                childCount: count,
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
