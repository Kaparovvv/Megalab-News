// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../feature/auth/presentation/auth_screen.dart' as _i8;
import '../../feature/news_feed/domain/entities/post_list_entity.dart' as _i13;
import '../../feature/news_feed/presentation/screens/news_list_screen/news_list_screen.dart'
    as _i2;
import '../../feature/news_feed/presentation/screens/news_screen/news_screen.dart'
    as _i4;
import '../../feature/news_feed/presentation/screens/selected_news_screen/selected_news_screen.dart'
    as _i9;
import '../../feature/profile/presentation/screens/news_publication_screen/news_publication_screen.dart'
    as _i5;
import '../../feature/profile/presentation/screens/profile_screen/profile_screen.dart'
    as _i6;
import '../../feature/register/domain/entities/user_entities.dart' as _i12;
import '../../feature/register/presentation/screens/example_screen.dart' as _i3;
import '../../feature/register/presentation/screens/registration_screen.dart'
    as _i7;
import '../../feature/splash/splash_screen/splash_screen.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    NewsListScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.NewsListScreen(),
      );
    },
    ExampleScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ExampleScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ExampleScreen(
          key: args.key,
          userEntity: args.userEntity,
        ),
      );
    },
    NewsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NewsScreenRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.NewsScreen(
          key: args.key,
          postData: args.postData,
        ),
      );
    },
    NewsPublicationScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.NewsPublicationScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RegistrationScreen(),
      );
    },
    AuthScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AuthScreen(),
      );
    },
    SelectedNewsScreenRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.SelectedNewsScreen(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splashScreen',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          SplashScreenRoute.name,
          path: 'splashScreen',
        ),
        _i10.RouteConfig(
          NewsListScreenRoute.name,
          path: 'newsList',
        ),
        _i10.RouteConfig(
          ExampleScreenRoute.name,
          path: 'example',
        ),
        _i10.RouteConfig(
          NewsScreenRoute.name,
          path: 'news',
        ),
        _i10.RouteConfig(
          NewsPublicationScreenRoute.name,
          path: 'publication',
        ),
        _i10.RouteConfig(
          ProfileScreenRoute.name,
          path: 'profile',
        ),
        _i10.RouteConfig(
          RegistrationScreenRoute.name,
          path: 'registration',
        ),
        _i10.RouteConfig(
          AuthScreenRoute.name,
          path: 'authorization',
        ),
        _i10.RouteConfig(
          SelectedNewsScreenRoute.name,
          path: 'selectedNews',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i10.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: 'splashScreen',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.NewsListScreen]
class NewsListScreenRoute extends _i10.PageRouteInfo<void> {
  const NewsListScreenRoute()
      : super(
          NewsListScreenRoute.name,
          path: 'newsList',
        );

  static const String name = 'NewsListScreenRoute';
}

/// generated route for
/// [_i3.ExampleScreen]
class ExampleScreenRoute extends _i10.PageRouteInfo<ExampleScreenRouteArgs> {
  ExampleScreenRoute({
    _i11.Key? key,
    required _i12.UserEntity userEntity,
  }) : super(
          ExampleScreenRoute.name,
          path: 'example',
          args: ExampleScreenRouteArgs(
            key: key,
            userEntity: userEntity,
          ),
        );

  static const String name = 'ExampleScreenRoute';
}

class ExampleScreenRouteArgs {
  const ExampleScreenRouteArgs({
    this.key,
    required this.userEntity,
  });

  final _i11.Key? key;

  final _i12.UserEntity userEntity;

  @override
  String toString() {
    return 'ExampleScreenRouteArgs{key: $key, userEntity: $userEntity}';
  }
}

/// generated route for
/// [_i4.NewsScreen]
class NewsScreenRoute extends _i10.PageRouteInfo<NewsScreenRouteArgs> {
  NewsScreenRoute({
    _i11.Key? key,
    required _i13.PostListEntity postData,
  }) : super(
          NewsScreenRoute.name,
          path: 'news',
          args: NewsScreenRouteArgs(
            key: key,
            postData: postData,
          ),
        );

  static const String name = 'NewsScreenRoute';
}

class NewsScreenRouteArgs {
  const NewsScreenRouteArgs({
    this.key,
    required this.postData,
  });

  final _i11.Key? key;

  final _i13.PostListEntity postData;

  @override
  String toString() {
    return 'NewsScreenRouteArgs{key: $key, postData: $postData}';
  }
}

/// generated route for
/// [_i5.NewsPublicationScreen]
class NewsPublicationScreenRoute extends _i10.PageRouteInfo<void> {
  const NewsPublicationScreenRoute()
      : super(
          NewsPublicationScreenRoute.name,
          path: 'publication',
        );

  static const String name = 'NewsPublicationScreenRoute';
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileScreenRoute extends _i10.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i7.RegistrationScreen]
class RegistrationScreenRoute extends _i10.PageRouteInfo<void> {
  const RegistrationScreenRoute()
      : super(
          RegistrationScreenRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationScreenRoute';
}

/// generated route for
/// [_i8.AuthScreen]
class AuthScreenRoute extends _i10.PageRouteInfo<void> {
  const AuthScreenRoute()
      : super(
          AuthScreenRoute.name,
          path: 'authorization',
        );

  static const String name = 'AuthScreenRoute';
}

/// generated route for
/// [_i9.SelectedNewsScreen]
class SelectedNewsScreenRoute extends _i10.PageRouteInfo<void> {
  const SelectedNewsScreenRoute()
      : super(
          SelectedNewsScreenRoute.name,
          path: 'selectedNews',
        );

  static const String name = 'SelectedNewsScreenRoute';
}
