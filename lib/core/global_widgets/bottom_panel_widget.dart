import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';

class BottomPanelWidget extends StatelessWidget {
  const BottomPanelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                textStyle:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.white),
                onPressed: () => context.router.push(
                  const ProfileScreenRoute(),
                ),
              ),
              SizedBox(width: 26.w),
              CustomTextButtonWidget(
                text: 'Избранные новости',
                textStyle:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.white),
                onPressed: () => context.router.push(
                  const SelectedNewsScreenRoute(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
