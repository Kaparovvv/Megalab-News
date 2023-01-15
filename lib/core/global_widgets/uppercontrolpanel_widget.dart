import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';

class UpperControlPanelWidget extends StatelessWidget {
  final Color theme;
  const UpperControlPanelWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          ImagesHelper.megalabLogo,
          width: 98.w,
          height: 22.h,
          color: theme,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomIconButtonWidget(
              onPressed: () {},
              iconUrl: IconHelper.search,
              color: theme,
              size: 22,
            ),
            SizedBox(width: 18.w),
            CustomIconButtonWidget(
              onPressed: () => context.router.push(const ProfileScreenRoute()),
              iconUrl: IconHelper.user,
              color: theme,
              size: 22,
            ),
            SizedBox(width: 18.w),
            CustomIconButtonWidget(
              onPressed: () {},
              iconUrl: IconHelper.menu,
              color: theme,
              size: 22,
            ),
          ],
        ),
      ],
    );
  }
}
