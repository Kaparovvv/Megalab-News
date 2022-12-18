import 'package:flutter/material.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomIconButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String iconUrl;
  final Color color;
  final double size;
  const CustomIconButtonWidget({
    Key? key,
    required this.onPressed,
    required this.iconUrl,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      iconSize: size,
      onPressed: () => onPressed(),
      icon: ImageIcon(
        AssetImage(iconUrl),
        color: color,
      ),
    );
  }
}
