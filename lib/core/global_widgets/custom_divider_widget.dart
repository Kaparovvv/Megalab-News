import 'package:flutter/material.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      color: ThemeHelper.dividerColor,
    );
  }
}
