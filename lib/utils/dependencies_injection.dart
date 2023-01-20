import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:megalab_news_app/core/error/failure_to_message.dart';
import 'package:megalab_news_app/core/platform/network_info.dart';
import 'package:megalab_news_app/feature/auth/data/data_sources/user_token_local_data_source.dart';
import 'package:megalab_news_app/feature/auth/data/data_sources/user_token_remote_data_source.dart';
import 'package:megalab_news_app/feature/auth/data/repositories/auth_repository.dart';
import 'package:megalab_news_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:megalab_news_app/feature/auth/domain/usecases/auth_user.dart';
import 'package:megalab_news_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/post_list/post_list_local_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/data_sources/post_list/post_list_remote_data_source.dart';
import 'package:megalab_news_app/feature/news_feed/data/repositories/post_detail_repository.dart';
import 'package:megalab_news_app/feature/news_feed/data/repositories/post_list_repository_impl.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/post_detail_repository.dart';
import 'package:megalab_news_app/feature/news_feed/domain/repositories/post_list_repository.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/post_detail.dart';
import 'package:megalab_news_app/feature/news_feed/domain/usecases/post_list.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/post_detail_bloc/post_detail_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/post_list_bloc/post_bloc.dart';
import 'package:megalab_news_app/feature/register/data/data_sources/user_local_data_source.dart';
import 'package:megalab_news_app/feature/register/data/data_sources/user_remote_data_source.dart';
import 'package:megalab_news_app/feature/register/data/repositories/register_repository_impl.dart';
import 'package:megalab_news_app/feature/register/domain/repositories/register_repository.dart';
import 'package:megalab_news_app/feature/register/domain/usecases/register_user.dart';
import 'package:megalab_news_app/feature/register/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../feature/news_feed/data/data_sources/post_detail/post_detail_local_data_source.dart';
import '../feature/news_feed/data/data_sources/post_detail/post_detail_remote_data_source.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///Blocs

  //UserData
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(registerUser: getIt.get<RegisterUser>()),
  );

  //UserToken
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(authUser: getIt.get<AuthUser>()),
  );

  //PostsList
  getIt.registerFactory(
    () => PostBloc(
      postList: getIt.get<PostList>(),
      postDetail: getIt.get<PostDetail>(),
    ),
  );

  //PostDetailBloc
  getIt.registerFactory(
    () => PostDetailBloc(
      postDetail: getIt.get<PostDetail>(),
    ),
  );

  ///UseCases

  //UserData
  getIt.registerFactory<RegisterUser>(
    () => RegisterUser(getIt()),
  );

  //UserToken
  getIt.registerFactory<AuthUser>(
    () => AuthUser(getIt()),
  );

  //PostList
  getIt.registerFactory(
    () => PostList(getIt()),
  );

  //PostDetail
  getIt.registerFactory(
    () => PostDetail(getIt()),
  );

  ///Repository

  //UserData
  getIt.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //UserToken
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //PostsList
  getIt.registerLazySingleton<PostListRepository>(() => PostListRepositoryImpl(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //PostDetail
  getIt.registerLazySingleton<PostDetailRepository>(
      () => PostDetailRepositoryImpl(
            localDataSource: getIt(),
            remoteDataSource: getIt(),
            networkInfo: getIt(),
          ));

  ///Data_Source

  //UserData
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //UserToken
  getIt.registerLazySingleton<UserTokenRemoteDataSource>(
    () => UserTokenRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<UserTokenLocalDataSource>(
    () => UserTokenLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //PostsList
  getIt.registerLazySingleton<PostListRemoteDataSource>(
    () => PostListRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<PostListLocalDataSource>(
    () => PostListLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //PostDetail
  getIt.registerLazySingleton<PostDetailRemoteDataSource>(
    () => PostDetailRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<PostDetailLocalDataSource>(
    () => PostDetailLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  ///Core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );

  ///External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Connectivity());

//FailureToMessage
  getIt.registerLazySingleton<FailureToMessage>(() => FailureToMessage());
}
