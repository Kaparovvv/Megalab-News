import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_textbutton_widget.dart';
import 'package:megalab_news_app/feature/presentation/screens/news_screen/local_widgets/filtering_dialog_widget.dart';
import 'package:megalab_news_app/feature/presentation/screens/news_screen/local_widgets/news_bar_widget.dart';
import 'package:megalab_news_app/feature/presentation/screens/news_screen/local_widgets/news_publication_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 163.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: const NewsBarWidget(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 16.h, right: 20.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
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
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 1.sw,
                    height: 400.h,
                    child: const SingleChildScrollView(
                      child: NewsPublicationWidget(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 1.sw,
              height: 150.h,
              color: ThemeHelper.color151515,
              padding: EdgeInsets.only(top: 35.h),
              child: Column(
                children: [
                  Image.asset(
                    ImagesHelper.megalabLogo,
                    color: ThemeHelper.white,
                    width: 129.w,
                    height: 29.h,
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextButtonWidget(
                        text: 'Мой профиль',
                        textStyle: TextStyleHelper.f16w400
                            .copyWith(color: ThemeHelper.white),
                        onPressed: () {},
                      ),
                      SizedBox(width: 26.w),
                      CustomTextButtonWidget(
                        text: 'Избранные новости',
                        textStyle: TextStyleHelper.f16w400
                            .copyWith(color: ThemeHelper.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
