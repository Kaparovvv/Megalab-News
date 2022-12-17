import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final String title;
  final TextInputType? keyboardType;
  const CustomTextFieldWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    required this.title,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: widget.width.w,
          height: widget.height.h,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            textInputAction: TextInputAction.next,
            style: TextStyleHelper.f14w500.copyWith(decorationThickness: 0),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: ThemeHelper.colorE4DFDC),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: ThemeHelper.blueAccent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: ThemeHelper.red),
              ),
            ),
          ),
        )
      ],
    );
  }
}
