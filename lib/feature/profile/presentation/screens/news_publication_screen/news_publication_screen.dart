import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/textfield_with_text_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/news_publication_screen/local_widgets/category_dropdown_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/news_publication_screen/local_widgets/load_newscover_widget.dart';

import 'local_widgets/selected_category_widget.dart';

class NewsPublicationScreen extends StatelessWidget {
  const NewsPublicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categoryList = [
      'Спорт',
      'Детское',
      'Взрослое',
      'Экономика',
    ];
    // SizeManager sizeManager = SizeManager(context);
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ThemeHelper.white,
      appBar: AppBar(
        backgroundColor: ThemeHelper.white,
        elevation: 0,
        actions: [
          IconButton(
            padding: EdgeInsets.only(
              top: 21.5.h,
              right: 21.5.w,
            ),
            onPressed: () {},
            constraints: const BoxConstraints(),
            icon: Icon(
              Icons.close_outlined,
              color: ThemeHelper.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 34.w,
            right: 23.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoadNewsCoverWidget(),
              SizedBox(height: 16.h),
              TextFieldWithTextWidget(
                title: 'Заголовок',
                constraints: BoxConstraints(maxHeight: 35.h, maxWidth: 263.w),
                controller: TextEditingController(),
                radius: 5,
              ),
              SizedBox(height: 16.h),
              TextFieldWithTextWidget(
                title: 'Краткое описание',
                constraints: BoxConstraints(maxHeight: 35.h, maxWidth: 263.w),
                controller: TextEditingController(),
                radius: 5,
              ),
              SizedBox(height: 16.h),
              TextFieldWithTextWidget(
                title: 'Текст новости',
                constraints: BoxConstraints(maxHeight: 95.h, maxWidth: 263.w),
                controller: TextEditingController(),
                maxLines: 100,
                radius: 5,
              ),
              SizedBox(height: 16.h),
              CategoryDropDownWidget(
                title: 'Выбрать категорию',
                listOfItem: categoryList,
                width: 263.w,
                height: 35.h,
                textStyle:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
              ),
              SizedBox(height: 12.h),
              const SelectedCategoryWidget(category: 'не выбрано'),
              SizedBox(height: 38.h),
              Align(
                alignment: Alignment.topCenter,
                child: CustomButtonWidget(
                  txtButton: 'Создать',
                  width: 191.w,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
