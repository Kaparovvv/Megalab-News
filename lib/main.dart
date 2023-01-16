import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:megalab_news_app/feature/register/data/models/user_data_model.dart';
import 'package:megalab_news_app/feature/register/domain/usecases/register_user.dart';
import 'package:megalab_news_app/internal/application.dart';
import 'feature/register/presentation/blocs/register_bloc/register_bloc.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Blocs
  getIt.registerSingleton(
    RegisterBloc(registerUser: getIt.get<RegisterUser>()),
    signalsReady: true,
  );
  // getIt.registerSingleton<RegisterBloc>(() => RegisterBloc(registerUser: getIt())
  //     signalsReady: true);
  // getIt.registerFactory(
  //   () => RegisterBloc(registerUser: getIt()),
  // );

  //UseCases
  getIt.registerLazySingleton(
    () => RegisterUser(getIt()),
  );

  await Hive.initFlutter();
  await Hive.openBox<UserDataModel>('userDataBox');
  runApp(MyApp());
}
