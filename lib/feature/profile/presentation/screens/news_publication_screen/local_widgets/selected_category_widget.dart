import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class SelectedCategoryWidget extends StatelessWidget {
  const SelectedCategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: ThemeHelper.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: ThemeHelper.white016,
            offset: Offset(0, 1.r),
            blurRadius: 8.r,
            spreadRadius: 0,
          )
        ],
      ),
      child: Text(
        '#$category',
        style: TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
      ),
    );
  }
}
