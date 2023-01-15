import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      builder: (context, child) => MaterialApp.router(
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
    );
  }
}
