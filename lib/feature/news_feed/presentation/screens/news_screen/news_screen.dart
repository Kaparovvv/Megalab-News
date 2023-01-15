import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';
import 'package:megalab_news_app/core/global_widgets/news_sliver_appbar_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_list_screen/local_widgets/news_publication_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

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
                      isExtended: true,
                      onPressed: () => context.router.navigateBack(),
                    ),
                    SizedBox(height: 35.h),
                    Text('Комментарии', style: TextStyleHelper.f24w500),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Олег Петров',
                      style: TextStyleHelper.f18w500,
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                      style: TextStyleHelper.f16w400,
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '29.11.2022',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Вы',
                          style: TextStyleHelper.f18w500,
                        ),
                        CustomTextFieldWidget(
                          width: 198.w,
                          height: 27.h,
                          controller: TextEditingController(),
                          maxLines: 20,
                        ),
                        CustomButtonWidget(
                          onPressed: () {
                            var width = MediaQuery.of(context).size.width;
                            log(width.toString());
                          },
                          width: 37,
                          height: 27,
                          isChildText: false,
                          iconUrl: IconHelper.arrowUp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 24.h, left: 20.w, bottom: 58.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFieldWidget(
                      width: 271,
                      height: 38,
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
