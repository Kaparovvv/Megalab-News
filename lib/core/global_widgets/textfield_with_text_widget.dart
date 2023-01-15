import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';

class TextFieldWithTextWidget extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final String title;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? radius;
  const TextFieldWithTextWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    required this.title,
    this.keyboardType,
    this.maxLines,
    this.radius,
  }) : super(key: key);

  @override
  State<TextFieldWithTextWidget> createState() =>
      _TextFieldWithTextWidgetState();
}

class _TextFieldWithTextWidgetState extends State<TextFieldWithTextWidget> {
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
        CustomTextFieldWidget(
          width: widget.width.r,
          height: widget.height.r,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          radius: widget.radius,
        ),
      ],
    );
  }
}
