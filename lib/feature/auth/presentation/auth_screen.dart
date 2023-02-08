import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/commons/validates_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_snackbar.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/textfield_with_text_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:megalab_news_app/feature/register/presentation/local_widgets/password_textfield_widget.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

import '../../../commons/names_helper.dart';
import '../../../utils/dependencies_export.dart';

class AuthScreen extends StatefulWidget {
  final bool isBackButton;
  final void Function(bool isLoggedIn)? onLoginResult;
  const AuthScreen({super.key, this.isBackButton = false, this.onLoginResult});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController nicknameController;
  late TextEditingController passwordController;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  ValidatesHelper validatesHelper = ValidatesHelper();

  late AuthBloc _authBloc;
  @override
  void initState() {
    _authBloc = BlocProvider.of(context, listen: false);
    nicknameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: widget.isBackButton
            ? IconButton(
                onPressed: () => context.router.navigateBack(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ThemeHelper.color7E5BC2,
                ),
              )
            : const SizedBox(),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Form(
                key: _formkey,
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
                      controller: nicknameController,
                      title: 'Никнейм',
                      validate: (value) =>
                          validatesHelper.titleValidate(value!, 'никнейм'),
                    ),
                    SizedBox(height: 16.h),
                    PasswordTextFieldWidget(
                      title: 'Пароль',
                      controller: passwordController,
                      validate: (value) =>
                          validatesHelper.titleValidate(value!, 'пароль'),
                    ),
                    SizedBox(height: 36.h),
                    BlocConsumer<AuthBloc, AuthState>(
                      bloc: _authBloc,
                      listener: (context, state) {
                        if (state is LoadedAuthState) {
                          context.router.replace(const NewsListScreenRoute());
                          nicknameController.dispose();
                          passwordController.dispose();
                          widget.onLoginResult?.call(true);
                        }

                        if (state is ErrorAuthState) {
                          showCustomSnackBar(context, state.message);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingAuthState) {
                          return const LoadingIndicatorWidget(size: 30);
                        }
                        return CustomButtonWidget(
                          txtButton: 'Войти',
                          onPressed: () {
                            log('User Token =========== ${getIt.get<SharedPreferences>().getString(NamesHelper.cacheUserToken)}');
                            if (_formkey.currentState!.validate()) {
                              _authBloc.add(
                                AuthUserEvent(
                                  nickname: nicknameController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                          width: 168,
                        );
                      },
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'У вас нет аккаунта?',
                          style: TextStyleHelper.f12w400
                              .copyWith(color: ThemeHelper.color5A5A5A),
                        ),
                        CustomTextButtonWidget(
                          onPressed: () => context.router.push(
                            const RegistrationScreenRoute(),
                          ),
                          text: 'зарегистрироваться',
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
      ),
    );
  }
}
