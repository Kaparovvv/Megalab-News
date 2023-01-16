import 'package:get_it/get_it.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/register/data/data_sources/user_remote_data_source.dart';
import 'package:megalab_news_app/feature/register/data/repositories/register_repository_impl.dart';
import 'package:megalab_news_app/feature/register/domain/repositories/register_repository.dart';
import 'package:megalab_news_app/feature/register/domain/usecases/register_user.dart';
import 'package:megalab_news_app/feature/register/presentation/blocs/register_bloc/register_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//Blocs
  sl.registerFactory(
    () => RegisterBloc(registerUser: sl()),
  );

  //UseCases
  sl.registerLazySingleton(
    () => RegisterUser(sl()),
  );

// Repository
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl());

//Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );
}
