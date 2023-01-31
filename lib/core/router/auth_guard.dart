// import 'package:auto_route/auto_route.dart';
// import 'package:megalab_news_app/commons/names_helper.dart';
// import 'package:megalab_news_app/core/router/app_router.gr.dart';
// import 'package:megalab_news_app/utils/dependencies_export.dart';
// import 'package:megalab_news_app/utils/dependencies_injection.dart';

// class AuthGuard extends AutoRouteGuard {
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     var token =
//         getIt.get<SharedPreferences>().getString(NamesHelper.cacheUserToken);
//     if (token!.isNotEmpty) {
//       resolver.next(true);
//     } else {
//       router.push(
//         AuthScreenRoute(
//           onResult: (success) {
//             resolver.next(success);
//           },
//         ),
//       );
//     }
//   }
// }
