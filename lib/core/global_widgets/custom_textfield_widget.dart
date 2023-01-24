import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.maxLines,
    this.radius,
    this.hinText,
    this.onChanged,
    this.validate,
    this.constraints,
  }) : super(key: key);

  final FormFieldValidator<String>? validate;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? radius;
  final String? hinText;
  final ValueChanged<String>? onChanged;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      style: TextStyleHelper.f14w500.copyWith(decorationThickness: 0),
      decoration: InputDecoration(
        hintText: hinText ?? '',
        hintStyle: TextStyleHelper.f16w400,
        constraints: constraints ?? const BoxConstraints(),
        contentPadding: const EdgeInsets.only(top: 0.5, left: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: ThemeHelper.blueAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: ThemeHelper.colorE4DFDC),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: ThemeHelper.blueAccent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: ThemeHelper.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: ThemeHelper.blueAccent),
        ),
      ),
      onChanged: onChanged,
      validator: validate,
    );
  }
}
