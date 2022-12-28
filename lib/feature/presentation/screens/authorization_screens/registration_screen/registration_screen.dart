import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_textfield_widget.dart';
import 'package:megalab_news_app/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/presentation/screens/authorization_screens/local_widgets/password_textfield_widget.dart';
import 'package:megalab_news_app/feature/presentation/global_widgets/custom_textbutton_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: Column(
                children: [
                  Image.asset(
                    ImagesHelper.megalabLogo,
                    width: 129.w,
                    height: 29.h,
                  ),
                  SizedBox(height: 31.h),
                  CustomTextFieldWidget(
                    width: 231,
                    height: 39,
                    controller: TextEditingController(),
                    title: 'Фамилия',
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFieldWidget(
                    width: 231,
                    height: 39,
                    controller: TextEditingController(),
                    title: 'Имя',
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFieldWidget(
                    width: 231,
                    height: 39,
                    controller: TextEditingController(),
                    title: 'Никнейм',
                  ),
                  SizedBox(height: 16.h),
                  PasswordTextFieldWidget(
                    controller: TextEditingController(),
                    title: 'Пароль',
                  ),
                  SizedBox(height: 16.h),
                  PasswordTextFieldWidget(
                    controller: TextEditingController(),
                    title: 'Пароль',
                  ),
                  SizedBox(height: 32.h),
                  CustomButtonWidget(
                    width: 191,
                    txtButton: 'Регистрация',
                    onPressed: () {},
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Уже есть логин?',
                        style: TextStyleHelper.f12w400
                            .copyWith(color: ThemeHelper.color5A5A5A),
                      ),
                      CustomTextButtonWidget(
                        onPressed: () => context.router.push(
                          const AuthScreenRoute(),
                        ),
                        text: 'Войти',
                        textStyle: TextStyleHelper.f12w400.copyWith(
                          color: ThemeHelper.color2D4EC2,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
