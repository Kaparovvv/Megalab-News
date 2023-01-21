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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../feature/auth/presentation/auth_screen.dart' as _i7;
import '../../feature/news_feed/presentation/screens/news_list_screen/news_list_screen.dart'
    as _i1;
import '../../feature/news_feed/presentation/screens/news_screen/news_screen.dart'
    as _i3;
import '../../feature/news_feed/presentation/screens/selected_news_screen/selected_news_screen.dart'
    as _i8;
import '../../feature/profile/presentation/screens/news_publication_screen/news_publication_screen.dart'
    as _i4;
import '../../feature/profile/presentation/screens/profile_screen/profile_screen.dart'
    as _i5;
import '../../feature/register/domain/entities/user_entities.dart' as _i11;
import '../../feature/register/presentation/screens/example_screen.dart' as _i2;
import '../../feature/register/presentation/screens/registration_screen.dart'
    as _i6;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    NewsListScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NewsListScreen(),
      );
    },
    ExampleScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ExampleScreenRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ExampleScreen(
          key: args.key,
          userEntity: args.userEntity,
        ),
      );
    },
    NewsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NewsScreenRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.NewsScreen(
          key: args.key,
          postId: args.postId,
        ),
      );
    },
    NewsPublicationScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NewsPublicationScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RegistrationScreen(),
      );
    },
    AuthScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AuthScreen(),
      );
    },
    SelectedNewsScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.SelectedNewsScreen(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'newsList',
          fullMatch: true,
        ),
        _i9.RouteConfig(
          NewsListScreenRoute.name,
          path: 'newsList',
        ),
        _i9.RouteConfig(
          ExampleScreenRoute.name,
          path: 'example',
        ),
        _i9.RouteConfig(
          NewsScreenRoute.name,
          path: 'news',
        ),
        _i9.RouteConfig(
          NewsPublicationScreenRoute.name,
          path: 'publication',
        ),
        _i9.RouteConfig(
          ProfileScreenRoute.name,
          path: 'profile',
        ),
        _i9.RouteConfig(
          RegistrationScreenRoute.name,
          path: 'registration',
        ),
        _i9.RouteConfig(
          AuthScreenRoute.name,
          path: 'authorization',
        ),
        _i9.RouteConfig(
          SelectedNewsScreenRoute.name,
          path: 'selectedNews',
        ),
      ];
}

/// generated route for
/// [_i1.NewsListScreen]
class NewsListScreenRoute extends _i9.PageRouteInfo<void> {
  const NewsListScreenRoute()
      : super(
          NewsListScreenRoute.name,
          path: 'newsList',
        );

  static const String name = 'NewsListScreenRoute';
}

/// generated route for
/// [_i2.ExampleScreen]
class ExampleScreenRoute extends _i9.PageRouteInfo<ExampleScreenRouteArgs> {
  ExampleScreenRoute({
    _i10.Key? key,
    required _i11.UserEntity userEntity,
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

  final _i10.Key? key;

  final _i11.UserEntity userEntity;

  @override
  String toString() {
    return 'ExampleScreenRouteArgs{key: $key, userEntity: $userEntity}';
  }
}

/// generated route for
/// [_i3.NewsScreen]
class NewsScreenRoute extends _i9.PageRouteInfo<NewsScreenRouteArgs> {
  NewsScreenRoute({
    _i10.Key? key,
    required int postId,
  }) : super(
          NewsScreenRoute.name,
          path: 'news',
          args: NewsScreenRouteArgs(
            key: key,
            postId: postId,
          ),
        );

  static const String name = 'NewsScreenRoute';
}

class NewsScreenRouteArgs {
  const NewsScreenRouteArgs({
    this.key,
    required this.postId,
  });

  final _i10.Key? key;

  final int postId;

  @override
  String toString() {
    return 'NewsScreenRouteArgs{key: $key, postId: $postId}';
  }
}

/// generated route for
/// [_i4.NewsPublicationScreen]
class NewsPublicationScreenRoute extends _i9.PageRouteInfo<void> {
  const NewsPublicationScreenRoute()
      : super(
          NewsPublicationScreenRoute.name,
          path: 'publication',
        );

  static const String name = 'NewsPublicationScreenRoute';
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileScreenRoute extends _i9.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i6.RegistrationScreen]
class RegistrationScreenRoute extends _i9.PageRouteInfo<void> {
  const RegistrationScreenRoute()
      : super(
          RegistrationScreenRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationScreenRoute';
}

/// generated route for
/// [_i7.AuthScreen]
class AuthScreenRoute extends _i9.PageRouteInfo<void> {
  const AuthScreenRoute()
      : super(
          AuthScreenRoute.name,
          path: 'authorization',
        );

  static const String name = 'AuthScreenRoute';
}

/// generated route for
/// [_i8.SelectedNewsScreen]
class SelectedNewsScreenRoute extends _i9.PageRouteInfo<void> {
  const SelectedNewsScreenRoute()
      : super(
          SelectedNewsScreenRoute.name,
          path: 'selectedNews',
        );

  static const String name = 'SelectedNewsScreenRoute';
}
