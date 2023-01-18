import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/register/data/data_sources/user_local_data_source.dart';
import 'package:megalab_news_app/feature/register/data/data_sources/user_remote_data_source.dart';
import 'package:megalab_news_app/feature/register/data/repositories/register_repository_impl.dart';
import 'package:megalab_news_app/feature/register/domain/repositories/register_repository.dart';
import 'package:megalab_news_app/feature/register/domain/usecases/register_user.dart';
import 'package:megalab_news_app/feature/register/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
//Blocs
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(registerUser: getIt.get<RegisterUser>()),
  );
  //UseCases
  getIt.registerFactory<RegisterUser>(
    () => RegisterUser(getIt()),
  );

// Repository
  getIt.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());

  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: getIt()));

//Core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );
//External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Connectivity());
}
