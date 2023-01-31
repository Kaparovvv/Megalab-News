import 'package:megalab_news_app/feature/profile/data/data_sources/put_user_data/put_user_data_remote_source.dart';
import 'package:megalab_news_app/feature/profile/data/repositories/user_data/put_user_data_repos_ext.dart';
import 'package:megalab_news_app/feature/profile/domain/repositories/user_data/put_user_data_repos.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  ///Blocs

  //RegisterBloc
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(registerUser: getIt()),
  );

  //UserToken
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(authUser: getIt()),
  );

  //PostsList
  getIt.registerFactory(
    () => PostBloc(
      postList: getIt(),
      postDetail: getIt(),
    ),
  );

  //PostDetailBloc
  getIt.registerFactory(
    () => PostDetailBloc(
      postDetail: getIt(),
    ),
  );

  //CommentBloc
  getIt.registerFactory(
    () => CommentBloc(
      commentToComment: getIt(),
      commentToPost: getIt(),
    ),
  );

  //FavoritesBloc
  getIt.registerFactory(
    () => FavoritesBloc(
      postToFavorites: getIt(),
      deleteFromFavorites: getIt(),
    ),
  );

  //FavoritesListBloc
  getIt.registerFactory(
    () => FavoriteListBloc(
      postsFromFavorites: getIt(),
    ),
  );

  //TagListBloc
  getIt.registerFactory(
    () => TagListBloc(
      tagList: getIt(),
    ),
  );

  //UserDataBloc
  getIt.registerFactory(
    () => UserDataBloc(
      getUserData: getIt(),
      putUserData: getIt(),
    ),
  );

  //LogoutBloc
  getIt.registerFactory(
    () => LogoutBloc(
      logout: getIt(),
    ),
  );

  //CreatePostBloc
  getIt.registerFactory(
    () => CreatePostBloc(
      createPost: getIt(),
    ),
  );

  //DeletePostBloc
  getIt.registerFactory(
    () => DeletePostBloc(
      deletePost: getIt(),
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
  getIt.registerFactory<RegisterRepository>(() => RegisterRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //UserToken
  getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: getIt(),
        localDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //PostsList
  getIt.registerFactory<PostListRepository>(() => PostListRepositoryImpl(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //PostDetail
  getIt.registerFactory<PostDetailRepository>(() => PostDetailRepositoryImpl(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //Comment
  getIt.registerFactory<CommentRepository>(() => CommentRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //Favorites
  getIt.registerFactory<FavoritesRepository>(() => FavoritesRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //TagList
  getIt.registerFactory<TagListRepository>(() => TagListRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //UserData
  getIt.registerFactory<UserDataRepository>(() => UserDataRepositoryExt(
        localDataSource: getIt(),
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //PutUserdata
  getIt.registerFactory<PutUserDataRepository>(() => PutUserDataReposExt(
        remoteDataSource: getIt(),
      ));

  //UserLogout
  getIt.registerFactory<UserLogoutRepository>(() => UserLogoutReposExt(
        remoteSource: getIt(),
        networkInfo: getIt(),
      ));

  //CreatePost
  getIt.registerFactory<CreatePostRepository>(() => CreatePostReposExt(
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //DeletePost
  getIt.registerFactory<DeletePostRepository>(() => DeletePostReposExt(
        remoteSource: getIt(),
        networkInfo: getIt(),
      ));

  ///Data_Source

  //RegisterUser
  getIt.registerFactory<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
  getIt.registerFactory<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //UserToken
  getIt.registerFactory<UserTokenRemoteDataSource>(
    () => UserTokenRemoteDataSourceImpl(),
  );
  getIt.registerFactory<UserTokenLocalDataSource>(
    () => UserTokenLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //PostsList
  getIt.registerFactory<PostListRemoteDataSource>(
    () => PostListRemoteDataSourceImpl(),
  );
  getIt.registerFactory<PostListLocalDataSource>(
    () => PostListLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //PostDetail
  getIt.registerFactory<PostDetailRemoteDataSource>(
    () => PostDetailRemoteDataSourceImpl(),
  );
  getIt.registerFactory<PostDetailLocalDataSource>(
    () => PostDetailLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  // CommentData
  getIt.registerFactory<CommentRemoteDataSource>(
    () => CommentRemoteDataSourceImpl(),
  );
  getIt.registerFactory<CommentLocalDataSource>(
    () => CommentLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //Favorites
  getIt.registerFactory<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(),
  );
  getIt.registerFactory<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //TagList
  getIt.registerFactory<TagListRemoteDataSource>(
    () => TagListRemoteDataSourceImpl(),
  );
  getIt.registerFactory<TagListLocalDataSource>(
    () => TagListLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  //UserData
  getIt.registerFactory<UserDataRemoteSource>(
    () => UserDataRemoteSourceImpl(),
  );
  getIt.registerFactory<UserDataLocalSource>(
    () => UserDataLocalSourceImpl(sharedPreferences: getIt()),
  );

  //PutUserData
  getIt.registerFactory<PutUserDataRemoteSource>(
      () => PutUserDataRemoteSourceImpl());

  //UserLogout
  getIt.registerFactory<UserLogoutRemoteSource>(
    () => UserLogoutRemoteSourceImpl(),
  );

  //CreatePost
  getIt.registerFactory<CreatePostRemoteSource>(
    () => CreatePostRemoteSourceImpl(),
  );

  //DeletePost
  getIt.registerFactory<DeletePostRemoteSource>(
    () => DeletePostRemoteSourceImpl(),
  );

  ///Core
  getIt.registerFactory<NetworkInfo>(
    () => NetworkInfoImpl(),
  );

  ///External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerFactory(() => Connectivity());

//FailureToMessage
  getIt.registerFactory<FailureToMessage>(() => FailureToMessage());
}
