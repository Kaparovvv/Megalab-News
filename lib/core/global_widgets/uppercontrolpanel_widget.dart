import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';

class UpperControlPanelWidget extends StatelessWidget {
  final Color theme;
  final bool isSearchButton;
  final Function() onSearch;
  final Function()? onLogout;

  final bool? isProfileButton;
  final bool? isLogout;
  const UpperControlPanelWidget({
    Key? key,
    required this.theme,
    this.isSearchButton = true,
    required this.onSearch,
    this.isProfileButton,
    this.isLogout,
    this.onLogout,
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
            isSearchButton
                ? CustomIconButtonWidget(
                    onPressed: () => onSearch(),
                    iconUrl: IconHelper.search,
                    color: theme,
                    size: 22,
                  )
                : const SizedBox(),
            SizedBox(width: isProfileButton ?? true ? 18.w : 0),
            isProfileButton ?? true
                ? CustomIconButtonWidget(
                    onPressed: () =>
                        context.router.push(const ProfileScreenRoute()),
                    iconUrl: IconHelper.user,
                    color: theme,
                    size: 22,
                  )
                : const SizedBox(),
            isLogout ?? false
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 18.w),
                      CustomIconButtonWidget(
                        onPressed: () => onLogout!(),
                        iconUrl: IconHelper.logout,
                        color: theme,
                        size: 22,
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
