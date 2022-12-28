import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_iconbutton_widget.dart';

class FilteringDialogWidget extends StatefulWidget {
  const FilteringDialogWidget({super.key});

  @override
  State<FilteringDialogWidget> createState() => _FilteringDialogWidgetState();
}

class _FilteringDialogWidgetState extends State<FilteringDialogWidget> {
  bool isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.only(
        top: 20.h,
        bottom: 27.h,
        left: 27.w,
        right: 27.w,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Фильтрация',
            style: TextStyleHelper.f18w500,
          ),
          SizedBox(height: 17.h),
          Row(
            children: [
              CustomIconButtonWidget(
                onPressed: () {
                  setState(() {
                    isCheckbox = !isCheckbox;
                  });
                },
                iconUrl:
                    isCheckbox ? IconHelper.checkbox : IconHelper.unchecked,
                color: isCheckbox ? ThemeHelper.color7E5BC2 : ThemeHelper.black,
                size: 30,
              ),
              SizedBox(width: 18.h),
              Text(
                'Спорт',
                style:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
              ),
            ],
          ),
          SizedBox(height: 25.5.h),
          CustomButtonWidget(
            txtButton: 'Применить',
            onPressed: () => Navigator.pop(context),
            width: 168.w,
          ),
        ],
      ),
    );
  }
}
