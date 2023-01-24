import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class IconSocialNetworkWidget extends StatelessWidget {
  final Function() onPressed;
  final String iconUrl;
  const IconSocialNetworkWidget({
    Key? key,
    required this.onPressed,
    required this.iconUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeHelper.colorFBF9FB,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () => onPressed(),
        icon: ImageIcon(
          AssetImage(iconUrl),
          color: ThemeHelper.black,
        ),
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            Size(15.71.w, 15.71.h),
          ),
        ),
      ),
    );
  }
}
