import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    this.keyboardType,
    this.maxLines,
    this.radius,
    this.hinText,
  }) : super(key: key);

  final double width;
  final double height;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? radius;
  final String? hinText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
        style: TextStyleHelper.f14w500.copyWith(decorationThickness: 0),
        decoration: InputDecoration(
          hintText: hinText ?? '',
          hintStyle: TextStyleHelper.f16w400,
          contentPadding: EdgeInsets.only(top: 0.5.h, left: 18.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            borderSide: const BorderSide(color: ThemeHelper.colorE4DFDC),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            borderSide: const BorderSide(color: ThemeHelper.blueAccent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
            borderSide: const BorderSide(color: ThemeHelper.red),
          ),
        ),
      ),
    );
  }
}
