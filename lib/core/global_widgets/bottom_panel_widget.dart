import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';

class BottomPanelWidget extends StatelessWidget {
  final String firstButton;
  final String secondButton;
  final Function() firstRoute;
  final Function() secondRoute;

  const BottomPanelWidget({
    Key? key,
    required this.firstButton,
    required this.secondButton,
    required this.firstRoute,
    required this.secondRoute,
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
                text: firstButton,
                textStyle:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.white),
                onPressed: () => firstRoute(),
              ),
              SizedBox(width: 26.w),
              CustomTextButtonWidget(
                text: secondButton,
                textStyle:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.white),
                onPressed: () => secondRoute(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
