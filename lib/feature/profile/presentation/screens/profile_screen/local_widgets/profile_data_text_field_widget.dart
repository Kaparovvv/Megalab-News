import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class ProfileDataTextFieldWidget extends StatefulWidget {
  final String typeTextField;
  final TextEditingController controller;
  final String? value;
  final bool readOnly;
  const ProfileDataTextFieldWidget({
    Key? key,
    required this.typeTextField,
    required this.controller,
    this.value,
    required this.readOnly,
  }) : super(key: key);
  @override
  State<ProfileDataTextFieldWidget> createState() =>
      _ProfileDataTextFieldWidgetState();
}

class _ProfileDataTextFieldWidgetState
    extends State<ProfileDataTextFieldWidget> {
  @override
  void initState() {
    widget.controller.text = widget.value ?? 'unknown';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.typeTextField,
          style: TextStyleHelper.f14w400,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 170.w,
          height: 38.h,
          child: TextFormField(
            controller: widget.controller,
            readOnly: widget.readOnly,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.left,
            style: TextStyleHelper.f14w500.copyWith(decorationThickness: 0),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 0.5.h,
                horizontal: 12.w,
              ),
              suffix: const ImageIcon(
                AssetImage(IconHelper.edit),
                size: 16,
                color: ThemeHelper.color5A5A5A,
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
            ),
          ),
        )
      ],
    );
  }
}
