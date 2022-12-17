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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../screens/authorization_screens/auth_screen/auth_screen.dart' as _i3;
import '../screens/authorization_screens/registration_screen/registration_screen.dart'
    as _i2;
import '../screens/news_screen/news_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    NewsScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NewsScreen(),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegistrationScreen(),
      );
    },
    AuthScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splashScreen',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          NewsScreenRoute.name,
          path: 'splashScreen',
        ),
        _i4.RouteConfig(
          RegistrationScreenRoute.name,
          path: 'registration',
        ),
        _i4.RouteConfig(
          AuthScreenRoute.name,
          path: 'authorization',
        ),
      ];
}

/// generated route for
/// [_i1.NewsScreen]
class NewsScreenRoute extends _i4.PageRouteInfo<void> {
  const NewsScreenRoute()
      : super(
          NewsScreenRoute.name,
          path: 'splashScreen',
        );

  static const String name = 'NewsScreenRoute';
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationScreenRoute extends _i4.PageRouteInfo<void> {
  const RegistrationScreenRoute()
      : super(
          RegistrationScreenRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationScreenRoute';
}

/// generated route for
/// [_i3.AuthScreen]
class AuthScreenRoute extends _i4.PageRouteInfo<void> {
  const AuthScreenRoute()
      : super(
          AuthScreenRoute.name,
          path: 'authorization',
        );

  static const String name = 'AuthScreenRoute';
}
