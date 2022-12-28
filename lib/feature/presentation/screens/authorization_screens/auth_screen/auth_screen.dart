import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_textfield_widget.dart';
import 'package:megalab_news_app/feature/presentation/screens/authorization_screens/local_widgets/password_textfield_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
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
                CustomTextFieldWidget(
                  width: 231,
                  height: 39,
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
