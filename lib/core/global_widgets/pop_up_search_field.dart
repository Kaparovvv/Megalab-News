import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';

class PopUpSearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function() onPressed;
  const PopUpSearchField({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  State<PopUpSearchField> createState() => _PopUpSearchFieldState();
}

class _PopUpSearchFieldState extends State<PopUpSearchField> {
  bool? isBack = true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      content: SizedBox(
        width: 320,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextFieldWidget(
              constraints: BoxConstraints(
                maxHeight: 38.h,
                maxWidth: 205.w,
                minHeight: 38.h,
                minWidth: 205.w,
              ),
              hinText: 'Поиск',
              controller: widget.controller,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    isBack = true;
                  });
                } else {
                  setState(() {
                    isBack = false;
                  });
                }
              },
            ),
            CustomButtonWidget(
              onPressed: () {
                if (isBack == true) {
                  context.router.pop();
                } else {
                  context.router.pop();
                  widget.onPressed();
                }
              },
              width: 50.r,
              height: 38.r,
              isChildText: false,
              iconUrl: isBack! ? IconHelper.cancel : IconHelper.search,
            ),
          ],
        ),
      ),
    );
  }
}
