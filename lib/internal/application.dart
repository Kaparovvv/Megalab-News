import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/profile/presentation/blocs/cubit/edit_button_cubit.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterBloc(
              registerUser: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => AuthBloc(
              authUser: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => PostBloc(
              postList: getIt(),
              postDetail: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => PostDetailBloc(
              postDetail: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => CommentBloc(
              commentToComment: getIt(),
              commentToPost: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => FavoriteListBloc(
              postsFromFavorites: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => TagListBloc(
              tagList: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => UserDataBloc(
              getUserData: getIt(),
              putUserData: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => LogoutBloc(
              logout: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => CreatePostBloc(
              createPost: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => DeletePostBloc(
              deletePost: getIt(),
            ),
          ),
          BlocProvider(
            create: (_) => EditButtonCubit(),
          ),
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
