import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';

class TextFieldWithTextWidget extends StatelessWidget {
  final FormFieldValidator<String>? validate;
  final TextEditingController controller;
  final String title;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? radius;
  final BoxConstraints? constraints;
  const TextFieldWithTextWidget({
    Key? key,
    required this.controller,
    required this.title,
    this.keyboardType,
    this.maxLines,
    this.radius,
    this.validate,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
        ),
        SizedBox(height: 8.h),
        CustomTextFieldWidget(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          radius: radius,
          validate: validate,
          constraints: constraints,
        ),
      ],
    );
  }
}
