import 'package:auto_route/auto_route.dart';
import 'package:megalab_news_app/screens/authorization_screens/auth_screen/auth_screen.dart';
import 'package:megalab_news_app/screens/authorization_screens/registration_screen/registration_screen.dart';
import 'package:megalab_news_app/screens/news_screen/news_screen.dart';
import 'package:megalab_news_app/screens/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'splashScreen', page: NewsScreen, initial: true),
    AutoRoute(path: 'registration', page: RegistrationScreen),
    AutoRoute(path: 'authorization', page: AuthScreen),
  ],
)
class $AppRouter {}
