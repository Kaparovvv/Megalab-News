import 'package:auto_route/auto_route.dart';
import 'package:megalab_news_app/feature/auth/presentation/auth_screen.dart';
import 'package:megalab_news_app/feature/register/presentation/screens/registration_screen.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_list_screen/news_list_screen.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/news_publication_screen/news_publication_screen.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/news_screen.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/profile_screen.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/favorites_news_screen/favorites_news_screen.dart';
import 'package:megalab_news_app/feature/splash/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page Route',
  routes: <AutoRoute>[
    AutoRoute(path: 'splashScreen', page: SplashScreen, initial: true),
    AutoRoute(path: 'newsList', page: NewsListScreen),
    AutoRoute(path: 'news', page: NewsScreen),
    AutoRoute(path: 'publication', page: NewsPublicationScreen),
    AutoRoute(path: 'profile', page: ProfileScreen),
    AutoRoute(path: 'registration', page: RegistrationScreen),
    AutoRoute(path: 'authorization', page: AuthScreen),
    AutoRoute(path: 'selectedNews', page: SelectedNewsScreen),
  ],
)
class $AppRouter {}
