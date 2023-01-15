import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/uppercontrolpanel_widget.dart';

class NewsBarWidget extends StatelessWidget {
  const NewsBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesHelper.newsBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const UpperControlPanelWidget(theme: ThemeHelper.white),
          Padding(
            padding: EdgeInsets.only(top: 62.h),
            child: Text(
              'Новости',
              style: TextStyleHelper.f42w500,
            ),
          ),
        ],
      ),
    );
  }
}
