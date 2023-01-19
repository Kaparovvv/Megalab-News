import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/textfield_with_text_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:megalab_news_app/feature/register/presentation/local_widgets/password_textfield_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late AuthBloc _authBloc;
  @override
  void initState() {
    _authBloc = BlocProvider.of(context, listen: false);
    super.initState();
  }

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
                  controller: nicknameController,
                  title: 'Никнейм',
                ),
                SizedBox(height: 16.h),
                PasswordTextFieldWidget(
                  title: 'Пароль',
                  controller: passwordController,
                ),
                SizedBox(height: 36.h),
                BlocConsumer<AuthBloc, AuthState>(
                  bloc: _authBloc,
                  listener: (context, state) {
                    if (state is LoadedAuthState) {
                      context.router.replace(const NewsListScreenRoute());
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingAuthState) {
                      return const LoadingIndicatorWidget(size: 30);
                    }
                    return CustomButtonWidget(
                      txtButton: 'Войти',
                      onPressed: () => _authBloc.add(
                        AuthUserEvent(
                          nickname: nicknameController.text,
                          password: passwordController.text,
                        ),
                      ),
                      width: 168,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
