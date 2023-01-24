import 'package:megalab_news_app/feature/profile/data/data_sources/put_user_data/put_user_data_remote_source.dart';
import 'package:megalab_news_app/feature/profile/data/repositories/user_data/put_user_data_repos_ext.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/user_data/put_user_data_repos.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///Blocs

  //RegisterBloc
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

  //CommentBloc
  getIt.registerFactory(
    () => CommentBloc(
      commentToComment: getIt.get<CommentToComment>(),
      commentToPost: getIt.get<CommentToPost>(),
    ),
  );

  //FavoritesBloc
  getIt.registerFactory(
    () => FavoritesBloc(
      postToFavorites: getIt.get<PostToFavorites>(),
      deleteFromFavorites: getIt.get<DeleteFromFavorites>(),
    ),
  );

  //FavoritesListBloc
  getIt.registerFactory(
    () => FavoriteListBloc(
      postsFromFavorites: getIt.get<PostsFromFavorites>(),
    ),
  );

  //TagListBloc
  getIt.registerFactory(
    () => TagListBloc(
      tagList: getIt.get<TagList>(),
    ),
  );

  //UserDataBloc
  getIt.registerFactory(
    () => UserDataBloc(
      getUserData: getIt.get<GetUserData>(),
      putUserData: getIt.get<PutUserData>(),
    ),
  );

  //LogoutBloc
  getIt.registerFactory(
    () => LogoutBloc(
      logout: getIt.get<UserLogout>(),
    ),
  );

  //CreatePostBloc
  getIt.registerFactory(
    () => CreatePostBloc(
      createPost: getIt.get<CreatePost>(),
    ),
  );

  //DeletePostBloc
  getIt.registerFactory(
    () => DeletePostBloc(
      deletePost: getIt.get<DeletePost>(),
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

  //CommentToComment
  getIt.registerFactory(
    () => CommentToComment(getIt()),
  );

  //CommentToPost
  getIt.registerFactory(
    () => CommentToPost(getIt()),
  );

  //Favorites
  getIt.registerFactory(
    () => PostToFavorites(getIt()),
  );
  getIt.registerFactory(
    () => DeleteFromFavorites(getIt()),
  );
  getIt.registerFactory(
    () => PostsFromFavorites(getIt()),
  );

  //TagList
  getIt.registerFactory(
    () => TagList(getIt()),
  );

  //GetUserData
  getIt.registerFactory(
    () => GetUserData(getIt()),
  );

//PutUserData
  getIt.registerFactory(
    () => PutUserData(
      getIt(),
    ),
  );

  //UserLogout
  getIt.registerFactory(
    () => UserLogout(getIt()),
  );

  //CreatePost
  getIt.registerFactory(
    () => CreatePost(getIt()),
  );

  //DeletePost
  getIt.registerFactory(
    () => DeletePost(getIt()),
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

  //Comment
  getIt.registerLazySingleton<CommentRepository>(() => CommentRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //Favorites
  getIt.registerLazySingleton<FavoritesRepository>(() => FavoritesRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //TagList
  getIt.registerLazySingleton<TagListRepository>(() => TagListRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //UserData
  getIt.registerLazySingleton<UserDataRepository>(() => UserDataRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //PutUserdata
  getIt.registerLazySingleton<PutUserDataRepository>(() => PutUserDataReposExt(
        remoteDataSource: getIt(),
      ));

  //UserLogout
  getIt.registerLazySingleton<UserLogoutRepository>(() => UserLogoutReposExt(
        remoteSource: getIt(),
        networkInfo: getIt(),
      ));

  //CreatePost
  getIt.registerLazySingleton<CreatePostRepository>(() => CreatePostReposExt(
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //DeletePost
  getIt.registerLazySingleton<DeletePostRepository>(() => DeletePostReposExt(
        remoteSource: getIt(),
        networkInfo: getIt(),
      ));

  ///Data_Source

  //RegisterUser
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

  // CommentData
  getIt.registerLazySingleton<CommentRemoteDataSource>(
    () => CommentRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<CommentLocalDataSource>(
    () => CommentLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //Favorites
  getIt.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //TagList
  getIt.registerLazySingleton<TagListRemoteDataSource>(
    () => TagListRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<TagListLocalDataSource>(
    () => TagListLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //UserData
  getIt.registerLazySingleton<UserDataRemoteSource>(
    () => UserDataRemoteSourceImpl(),
  );
  getIt.registerLazySingleton<UserDataLocalSource>(
    () => UserDataLocalSourceImpl(sharedPreferences: getIt()),
  );

  //PutUserData
  getIt.registerLazySingleton<PutUserDataRemoteSource>(
      () => PutUserDataRemoteSourceImpl());

  //UserLogout
  getIt.registerLazySingleton<UserLogoutRemoteSource>(
    () => UserLogoutRemoteSourceImpl(),
  );

  //CreatePost
  getIt.registerLazySingleton<CreatePostRemoteSource>(
    () => CreatePostRemoteSourceImpl(),
  );

  //DeletePost
  getIt.registerLazySingleton<DeletePostRemoteSource>(
    () => DeletePostRemoteSourceImpl(),
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
