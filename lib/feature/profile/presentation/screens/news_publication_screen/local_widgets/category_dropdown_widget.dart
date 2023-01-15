import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CategoryDropDownWidget extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  final List<String> listOfItem;
  final TextStyle textStyle;

  const CategoryDropDownWidget({
    super.key,
    required this.listOfItem,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.title,
  });

  @override
  State<CategoryDropDownWidget> createState() => _CategoryDropDownWidget();
}

class _CategoryDropDownWidget extends State<CategoryDropDownWidget> {
  String? _selectedLocation;
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
        Container(
          width: widget.width.w,
          height: widget.height.h,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeHelper.colorDEDCE4),
            borderRadius: BorderRadius.circular(5.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 10.w,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: const Icon(Icons.expand_more),
              iconSize: 24,
              iconEnabledColor: ThemeHelper.color858080,
              dropdownColor: ThemeHelper.white,
              style: TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
              hint: Text(
                "Не выбрано",
                style: widget.textStyle,
              ),
              value: _selectedLocation,
              onChanged: (newValue) {
                setState(() {
                  _selectedLocation = newValue;
                });
              },
              items: widget.listOfItem.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: widget.textStyle,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
