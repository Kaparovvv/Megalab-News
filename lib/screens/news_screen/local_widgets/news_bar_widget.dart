import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/global_widgets/custom_iconbutton_widget.dart';

class NewsBarWidget extends StatelessWidget {
  const NewsBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesHelper.newsBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 18.h, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    ImagesHelper.megalabLogo,
                    width: 98.w,
                    height: 22.h,
                    color: ThemeHelper.white,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIconButtonWidget(
                        onPressed: () {},
                        iconUrl: IconHelper.search,
                        color: ThemeHelper.white,
                        size: 22,
                      ),
                      SizedBox(width: 18.w),
                      CustomIconButtonWidget(
                        onPressed: () {},
                        iconUrl: IconHelper.user,
                        color: ThemeHelper.white,
                        size: 22,
                      ),
                      SizedBox(width: 18.w),
                      CustomIconButtonWidget(
                        onPressed: () {},
                        iconUrl: IconHelper.menu,
                        color: ThemeHelper.white,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 62.h),
              child: Text(
                'Новости',
                style: TextStyleHelper.f42w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
