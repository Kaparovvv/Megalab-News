import 'package:flutter/material.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';

class ButtonTryAgainWidget extends StatelessWidget {
  final Function() onPressed;
  const ButtonTryAgainWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Повторите попытку',
            style: TextStyleHelper.f24w500,
          ),
          const SizedBox(height: 10),
          CustomButtonWidget(
            onPressed: () => onPressed(),
            width: 150,
            isChildText: true,
            txtButton: 'Повторить',
          ),
        ],
      ),
    );
  }
}
