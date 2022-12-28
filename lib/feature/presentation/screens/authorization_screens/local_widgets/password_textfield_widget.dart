import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const PasswordTextFieldWidget({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _isObscureWidget = false;
  bool _isObscureText = true;
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
          width: 231.w,
          height: 39.h,
          child: TextFormField(
            controller: widget.controller,
            textInputAction: TextInputAction.next,
            style: TextStyleHelper.f14w500.copyWith(decorationThickness: 0),
            obscureText: _isObscureText,
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
              suffixIcon: _isObscureWidget
                  ? IconButton(
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: ThemeHelper.color7E5BC2,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                    )
                  : const SizedBox(),
            ),
            onChanged: (value) {
              setState(() {
                value.isNotEmpty
                    ? _isObscureWidget = true
                    : _isObscureWidget = false;
              });
            },
          ),
        )
      ],
    );
  }
}
