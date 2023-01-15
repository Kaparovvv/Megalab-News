import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:megalab_news_app/feature/register/data/models/user_data_model.dart';
import 'package:megalab_news_app/internal/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<UserDataModel>('userDataBox');
  runApp(MyApp());
}
