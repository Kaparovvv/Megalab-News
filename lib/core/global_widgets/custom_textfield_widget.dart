import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.constraints,
    required this.controller,
    this.keyboardType,
    this.maxLines,
    this.radius,
    this.hinText,
    this.onChanged,
  }) : super(key: key);

  final BoxConstraints constraints;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? radius;
  final String? hinText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      style: TextStyleHelper.f14w500.copyWith(decorationThickness: 0),
      decoration: InputDecoration(
        constraints: constraints,
        hintText: hinText ?? '',
        hintStyle: TextStyleHelper.f16w400,
        contentPadding: const EdgeInsets.only(top: 0.5, left: 18),
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
      onChanged: onChanged,
    );
  }
}
