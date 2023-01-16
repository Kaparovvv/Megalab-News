import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/register/domain/usecases/register_user.dart';
import 'package:megalab_news_app/feature/register/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:megalab_news_app/locator_sevice/locator_service.dart';
import 'package:megalab_news_app/main.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) =>
                  RegisterBloc(registerUser: getIt.get<RegisterUser>()))
        ],
        child: MaterialApp.router(
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          debugShowCheckedModeBanner: false,
          title: 'Megalab News',
          theme: ThemeData(
            fontFamily: 'Ubuntu',
            appBarTheme: const AppBarTheme(backgroundColor: ThemeHelper.white),
            primaryColor: ThemeHelper.white,
          ),
        ),
      ),
    );
  }
}
