import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class LoadNewsCoverWidget extends StatelessWidget {
  const LoadNewsCoverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Обложка новости',
          style: TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 120.w,
          height: 33.h,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeHelper.colorDEDCE4),
            borderRadius: BorderRadius.circular(5.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 15.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Загрузить',
                style: TextStyleHelper.f14w400,
              ),
              ImageIcon(
                AssetImage(IconHelper.download),
                color: ThemeHelper.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
