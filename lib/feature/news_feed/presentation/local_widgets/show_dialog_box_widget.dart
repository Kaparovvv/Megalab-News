import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/icon_social_network_widget.dart';

class ShowDialogBoxWidget extends StatelessWidget {
  const ShowDialogBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.only(
        top: 17.h,
        bottom: 18.h,
        left: 13.w,
        right: 8.w,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Поделиться',
                style: TextStyleHelper.f13w500,
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.close_outlined,
                  color: ThemeHelper.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(right: 28.w),
            child: Row(
              children: [
                IconSocialNetworkWidget(
                  onPressed: () {},
                  iconUrl: IconHelper.telegram,
                ),
                SizedBox(width: 24.w),
                IconSocialNetworkWidget(
                  onPressed: () {},
                  iconUrl: IconHelper.twitter,
                ),
                SizedBox(width: 24.w),
                IconSocialNetworkWidget(
                  onPressed: () {},
                  iconUrl: IconHelper.facebook,
                ),
                SizedBox(width: 24.w),
                IconSocialNetworkWidget(
                  onPressed: () {},
                  iconUrl: IconHelper.whatsapp,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Короткая ссылка',
            style: TextStyleHelper.f13w500,
          ),
          SizedBox(height: 8.h),
          Container(
            width: 270.w,
            height: 33.h,
            decoration: BoxDecoration(
              color: ThemeHelper.colorFBF9FB,
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.only(left: 16.w, right: 13.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Какой-то текст ссылки',
                  style: TextStyleHelper.f12w400,
                ),
                CustomIconButtonWidget(
                  onPressed: () {},
                  iconUrl: IconHelper.copy,
                  color: ThemeHelper.black,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
