import 'dart:async';

import 'package:flutter/material.dart';
import 'package:megalab_news_app/internal/application.dart';
import 'package:megalab_news_app/utils/dependencies_injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}
