import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_divider_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_snackbar.dart';
import 'package:megalab_news_app/core/global_widgets/loading_overlay_widget.dart';
import 'package:megalab_news_app/core/global_widgets/pop_up_search_field.dart';
import 'package:megalab_news_app/core/global_widgets/refresh_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/uppercontrolpanel_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/news_publication_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/blocs/cubit/edit_button_cubit.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/delete_post_dialog_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/logout_dialog_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/profile_photo_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/text_fields_column_widget.dart';

import '../../../../../utils/dependencies_export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();

  File? _imageProfile;
  late UserDataBloc _userDataBloc;
  late PostBloc _postBloc;

  @override
  void initState() {
    _userDataBloc = BlocProvider.of(context);
    _postBloc = BlocProvider.of(context);
    _userDataBloc.add(GetUserDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_imageProfile != null) {
      _userDataBloc.add(
        PutUserDataEvent(
          name: nameController.text,
          lastName: lastNameController.text,
          nickName: nickNameController.text,
          profileImage: _imageProfile,
        ),
      );
    }
    return Stack(
      children: [
        BlocConsumer<UserDataBloc, UserDataState>(
          bloc: _userDataBloc,
          listener: (context, state) {
            if (state is ErrorGetUserDataState) {
              showCustomSnackBar(context, state.message);
            }

            if (state is ErrorPutUserDataState) {
              showCustomSnackBar(context, state.message);
            }

            if (state is LoadedGetUserDataState) {
              _postBloc.add(
                GetPostListByAuthorEvent(
                  author: state.userDataEntity.nickname,
                  query: '',
                ),
              );
            }

            if (state is LoadedPutUserDataState) {
              _userDataBloc.add(GetUserDataEvent());
            }
          },
          builder: (context, state) {
            if (state is LoadingGetUserDataState) {
              return const LoadingOverlayWidget();
            }
            if (state is LoadingPutUserDataState) {
              return const LoadingOverlayWidget();
            }

            if (state is LoadedGetUserDataState) {
              var userData = state.userDataEntity;
              return Scaffold(
                backgroundColor: ThemeHelper.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: UpperControlPanelWidget(
                    theme: ThemeHelper.color7E5BC2,
                    isSearchButton: true,
                    isProfileButton: false,
                    isLogout: true,
                    onLogout: () => showDialog(
                      context: context,
                      builder: (context) => const LogoutDialogWidget(),
                    ),
                    onSearch: () => showDialog(
                      context: context,
                      builder: (context) => PopUpSearchField(
                        controller: searchController,
                        onPressed: () {
                          if (searchController.text.isNotEmpty) {
                            _postBloc.add(
                              GetPostListByAuthorEvent(
                                author: userData.nickname,
                                query: searchController.text,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: RefreshIndicatorWidget(
                    onRefresh: () async => _userDataBloc.add(
                      GetUserDataEvent(),
                    ),
                    child: BlocConsumer<PostBloc, PostState>(
                      bloc: _postBloc,
                      listener: (context, state) {
                        if (state is ErrorPostListState) {
                          showCustomSnackBar(context, state.message);
                        }

                        if (state is LoadedPostListState) {
                          searchController.clear();
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadedPostListState) {
                          var postList = state.postList;
                          return CustomScrollView(
                            controller: ScrollController(),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 42.h,
                                        left: 19.w,
                                        right: 20.w,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ProfilePhotoWidget(
                                                callback: ((profileImage) =>
                                                    setState(
                                                      () => _imageProfile =
                                                          profileImage,
                                                    )),
                                                imageUrl: userData.profileImage,
                                                deleteImage: () =>
                                                    _userDataBloc.add(
                                                  PutUserDataEvent(
                                                    name: nameController.text,
                                                    lastName:
                                                        lastNameController.text,
                                                    nickName:
                                                        nickNameController.text,
                                                    profileImage: null,
                                                  ),
                                                ),
                                              ),
                                              TextFieldsColumnWidget(
                                                lastNameController:
                                                    lastNameController,
                                                nameController: nameController,
                                                nickNameController:
                                                    nickNameController,
                                                name: userData.name,
                                                lastName: userData.lastName,
                                                nickName: userData.nickname,
                                                saveUserData: () =>
                                                    _userDataBloc.add(
                                                  PutUserDataEvent(
                                                    name: nameController.text,
                                                    lastName:
                                                        lastNameController.text,
                                                    nickName:
                                                        nickNameController.text,
                                                    profileImage: _imageProfile,
                                                  ),
                                                ),
                                                editUserData: () => context
                                                    .read<EditButtonCubit>()
                                                    .saveUserData(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 40.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Мои публикации',
                                                style: TextStyleHelper.f24w500,
                                              ),
                                              SizedBox(
                                                width: 65.w,
                                                height: 38.h,
                                                child: CustomButtonWidget(
                                                  isChildText: false,
                                                  width: 65.w,
                                                  height: 38.h,
                                                  iconUrl: IconHelper.add,
                                                  onPressed: () =>
                                                      context.router.push(
                                                    const NewsPublicationScreenRoute(),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              postList.isNotEmpty
                                  ? SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              top: 21.h,
                                              left: 20.w,
                                              right: 23.w,
                                            ),
                                            child: Column(
                                              children: [
                                                NewsPublicationWidget(
                                                  postData:
                                                      state.postList[index],
                                                  isExtended: false,
                                                  isDeleteButton: true,
                                                  deletePost: () => showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        DeletePostDialogWidget(
                                                      postId: state
                                                          .postList[index].id!,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 24.h),
                                                if (index !=
                                                    (state.postList.length - 1))
                                                  const CustomDividerWidget(),
                                              ],
                                            ),
                                          );
                                        },
                                        childCount: state.postList.length,
                                      ),
                                    )
                                  : SliverFillRemaining(
                                      hasScrollBody: false,
                                      child: Center(
                                        child: Text(
                                          'У вас пока нет публикаций',
                                          style: TextStyleHelper.f16w400,
                                        ),
                                      ),
                                    ),
                              SliverToBoxAdapter(
                                child: BottomPanelWidget(
                                  firstButton: 'Новости',
                                  firstRoute: () => context.router.replace(
                                    const NewsListScreenRoute(),
                                  ),
                                  secondButton: 'Избранные новости',
                                  secondRoute: () => context.router.replace(
                                    const SelectedNewsScreenRoute(),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
