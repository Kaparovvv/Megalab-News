import 'dart:async';

import 'package:flutter/material.dart';
import 'package:megalab_news_app/internal/application.dart';
import 'package:megalab_news_app/locator_sevice/locator_service.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

// class InternetConnection {
//   Future<void> network() async {
//     await execute(InternetConnectionChecker());
//     final InternetConnectionChecker customInstance =
//         InternetConnectionChecker.createInstance(
//       checkTimeout: const Duration(minutes: 1),
//       checkInterval: const Duration(minutes: 1),
//     );

//     await execute(customInstance);
//   }

//   Future<void> execute(InternetConnectionChecker connectionChecker) async {
//     // ignore: avoid_print
//     print('''Утверждение "этот компьютер подключен к Интернету" является: ''');
//     final bool isConnected = await InternetConnectionChecker().hasConnection;
//     // ignore: avoid_print
//     print(isConnected.toString());

//     // ignore: avoid_print
//     print(
//       'Current status: ${await InternetConnectionChecker().connectionStatus}',
//     );

//     final StreamSubscription<InternetConnectionStatus> listener =
//         InternetConnectionChecker().onStatusChange.listen(
//       (InternetConnectionStatus status) {
//         switch (status) {
//           case InternetConnectionStatus.connected:
//             // ignore: avoid_print
//             print('Data connection is available.');
//             break;
//           case InternetConnectionStatus.disconnected:
//             // ignore: avoid_print
//             print('You are disconnected from the internet.');
//             break;
//         }
//       },
//     );
//     await Future<void>.delayed(const Duration(seconds: 30));
//     await listener.cancel();
//   }
// }
