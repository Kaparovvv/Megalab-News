import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_divider_widget.dart';
import 'package:megalab_news_app/core/global_widgets/news_sliver_appbar_widget.dart';
import 'package:megalab_news_app/core/global_widgets/uppercontrolpanel_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/news_publication_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/news_publication_screen/news_publication_screen.dart';

class SelectedNewsScreen extends StatefulWidget {
  const SelectedNewsScreen({super.key});

  @override
  State<SelectedNewsScreen> createState() => _SelectedNewsScreenState();
}

class _SelectedNewsScreenState extends State<SelectedNewsScreen> {
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
      backgroundColor: ThemeHelper.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ThemeHelper.color7E5BC2),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const UpperControlPanelWidget(theme: ThemeHelper.color7E5BC2),
      ),
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 21.h, left: 20.w, right: 20.w),
                child: Text(
                  'Избранные новости',
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.f30w500,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(top: 21.h, left: 20.w, right: 20.w),
                    child: Column(
                      children: [
                        // NewsPublicationWidget(
                        //   image: '',
                        //   onPressed: () => context.router.push(
                        //     const NewsScreenRoute(),
                        //   ),
                        //   isExtended: false,
                        // ),
                        SizedBox(height: 24.h),
                        if (index != (count - 1)) const CustomDividerWidget(),
                      ],
                    ),
                  );
                },
                childCount: count,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 32.h),
                child: const BottomPanelWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
