import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomButtonWidget extends StatelessWidget {
  final String txtButton;
  final Function() onPressed;
  final double width;
  final double? height;
  const CustomButtonWidget({
    super.key,
    required this.txtButton,
    required this.onPressed,
    required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width.w, height ?? 30.h),
        elevation: 0,
        backgroundColor: ThemeHelper.color7E5BC2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        txtButton,
        style: TextStyleHelper.f16w500.copyWith(color: ThemeHelper.white),
      ),
    );
  }
}
