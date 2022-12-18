import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final TextStyle textStyle;
  const CustomTextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
