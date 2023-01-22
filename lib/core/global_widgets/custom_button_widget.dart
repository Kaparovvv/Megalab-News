import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomButtonWidget extends StatelessWidget {
  final bool isChildText;
  final String? txtButton;
  final Function() onPressed;
  final double width;
  final double? height;
  final String? iconUrl;
  // final

  const CustomButtonWidget({
    super.key,
    this.txtButton,
    required this.onPressed,
    required this.width,
    this.height,
    this.isChildText = true,
    this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 30,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: ThemeHelper.color7E5BC2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: isChildText
            ? Text(
                txtButton ?? '',
                style:
                    TextStyleHelper.f16w500.copyWith(color: ThemeHelper.white),
              )
            : ImageIcon(
                AssetImage(iconUrl ?? ''),
                color: ThemeHelper.white,
              ),
      ),
    );
  }
}
