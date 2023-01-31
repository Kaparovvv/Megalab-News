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
  late TextEditingController _nicknameController;
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _passwordController;
  late TextEditingController _password2Controller;

  late RegisterBloc _registerBloc;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  ValidatesHelper validatesHelper = ValidatesHelper();

  @override
  void initState() {
    _registerBloc = BlocProvider.of(context, listen: false);
    _nicknameController = TextEditingController();
    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _password2Controller = TextEditingController();
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
              padding: EdgeInsets.only(
                top: 24.h,
                left: 44.w,
                right: 44.w,
                bottom: 28.h,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Image.asset(
                      ImagesHelper.megalabLogo,
                      width: 129.w,
                      height: 29.h,
                    ),
                    SizedBox(height: 31.h),
                    TextFieldWithTextWidget(
                      controller: _lastNameController,
                      title: 'Фамилия',
                      validate: (value) =>
                          validatesHelper.titleValidate(value!, 'фамилию'),
                    ),
                    SizedBox(height: 16.h),
                    TextFieldWithTextWidget(
                      controller: _nameController,
                      title: 'Имя',
                      validate: (value) =>
                          validatesHelper.titleValidate(value!, 'имя'),
                    ),
                    SizedBox(height: 16.h),
                    TextFieldWithTextWidget(
                      controller: _nicknameController,
                      title: 'Никнейм',
                      validate: (value) =>
                          validatesHelper.titleValidate(value!, 'никнейм'),
                    ),
                    SizedBox(height: 16.h),
                    PasswordTextFieldWidget(
                      controller: _passwordController,
                      title: 'Пароль',
                      validate: (value) =>
                          validatesHelper.passwordValidate(value!),
                    ),
                    SizedBox(height: 16.h),
                    PasswordTextFieldWidget(
                        controller: _password2Controller,
                        title: 'Пароль',
                        validate: (value) {
                          if (_passwordController.text !=
                              _password2Controller.text) {
                            return 'Пароли не совпадают';
                          }
                          return null;
                        }),
                    SizedBox(height: 32.h),
                    BlocConsumer<RegisterBloc, RegisterState>(
                      bloc: _registerBloc,
                      listener: (context, state) {
                        if (state is ErrorRegisterState) {
                          showCustomSnackBar(context, state.message);
                        }
                        if (state is LoadedRegisterState) {
                          context.router.push(const AuthScreenRoute());
                          _nicknameController.dispose();
                          _nameController.dispose();
                          _lastNameController.dispose();
                          _passwordController.dispose();
                          _password2Controller.dispose();
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingRegisterState) {
                          return const LoadingIndicatorWidget(size: 30);
                        }
                        return CustomButtonWidget(
                          width: 191.w,
                          txtButton: 'Регистрация',
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _registerBloc.add(
                                UserRegisterEvent(
                                  nickname: _nicknameController.text,
                                  name: _nameController.text,
                                  lastName: _lastNameController.text,
                                  password: _passwordController.text,
                                  password2: _password2Controller.text,
                                ),
                              );
                            }
                          },
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
      ),
    );
  }
}
