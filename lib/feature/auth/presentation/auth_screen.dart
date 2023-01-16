import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/textfield_with_text_widget.dart';
import 'package:megalab_news_app/feature/register/presentation/local_widgets/password_textfield_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.router.navigateBack(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ThemeHelper.color7E5BC2,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImagesHelper.megalabLogo,
                  width: 129.w,
                  height: 29.h,
                ),
                SizedBox(height: 24.h),
                TextFieldWithTextWidget(
                  width: 231.w,
                  height: 39.h,
                  controller: TextEditingController(),
                  title: 'Никнейм',
                ),
                SizedBox(height: 16.h),
                PasswordTextFieldWidget(
                  title: 'Пароль',
                  controller: TextEditingController(),
                ),
                SizedBox(height: 36.h),
                CustomButtonWidget(
                  txtButton: 'Войти',
                  onPressed: () {},
                  width: 168,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
