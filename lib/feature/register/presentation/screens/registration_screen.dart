import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/textfield_with_text_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/register/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:megalab_news_app/feature/register/presentation/local_widgets/password_textfield_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  late RegisterBloc _registerBloc;

  @override
  void initState() {
    _registerBloc = BlocProvider.of(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
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
                  TextFieldWithTextWidget(
                    constraints:
                        BoxConstraints(maxHeight: 39.h, maxWidth: 231.w),
                    controller: lastNameController,
                    title: 'Фамилия',
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWithTextWidget(
                    constraints:
                        BoxConstraints(maxHeight: 39.h, maxWidth: 231.w),
                    controller: nameController,
                    title: 'Имя',
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWithTextWidget(
                    constraints:
                        BoxConstraints(maxHeight: 39.h, maxWidth: 231.w),
                    controller: nicknameController,
                    title: 'Никнейм',
                  ),
                  SizedBox(height: 16.h),
                  PasswordTextFieldWidget(
                    controller: passwordController,
                    title: 'Пароль',
                  ),
                  SizedBox(height: 16.h),
                  PasswordTextFieldWidget(
                    controller: password2Controller,
                    title: 'Пароль',
                  ),
                  SizedBox(height: 32.h),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    bloc: _registerBloc,
                    listener: (context, state) {
                      if (state is LoadedRegisterState) {
                        context.router.push(const AuthScreenRoute());
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingRegisterState) {
                        return const LoadingIndicatorWidget(size: 30);
                      }
                      return CustomButtonWidget(
                        width: 191.w,
                        txtButton: 'Регистрация',
                        onPressed: () => _registerBloc.add(
                          UserRegisterEvent(
                            nickname: nicknameController.text,
                            name: nameController.text,
                            lastName: lastNameController.text,
                            password: passwordController.text,
                            password2: password2Controller.text,
                          ),
                        ),
                      );
                    },
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
