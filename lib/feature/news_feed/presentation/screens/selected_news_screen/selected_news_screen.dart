import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/bottom_panel_widget.dart';
import 'package:megalab_news_app/core/global_widgets/btn_try_again_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_divider_widget.dart';
import 'package:megalab_news_app/core/global_widgets/loading_overlay_widget.dart';
import 'package:megalab_news_app/core/global_widgets/refresh_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/uppercontrolpanel_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/blocs/favorite_list_bloc/favorite_list_bloc.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/news_publication_widget.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

class SelectedNewsScreen extends StatefulWidget {
  const SelectedNewsScreen({super.key});

  @override
  State<SelectedNewsScreen> createState() => _SelectedNewsScreenState();
}

class _SelectedNewsScreenState extends State<SelectedNewsScreen> {
  ScrollController? _scrollController;
  late FavoriteListBloc _favoriteListBloc;

  @override
  void initState() {
    _favoriteListBloc = BlocProvider.of<FavoriteListBloc>(context);
    _favoriteListBloc.add(GetFromFavoritesListEvent());
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ThemeHelper.color7E5BC2),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const UpperControlPanelWidget(theme: ThemeHelper.color7E5BC2),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            BlocConsumer<FavoriteListBloc, FavoriteListState>(
              bloc: _favoriteListBloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is LoadingGetFromFavoritesState) {
                  return const LoadingOverlayWidget();
                }
                if (state is LoadedGetFromFavoritesState) {
                  return RefreshIndicatorWidget(
                    onRefresh: () async => _favoriteListBloc.add(
                      GetFromFavoritesListEvent(),
                    ),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 21.h, left: 20.w, right: 20.w),
                            child: Text(
                              'Избранные новости',
                              textAlign: TextAlign.center,
                              style: TextStyleHelper.f30w500,
                            ),
                          ),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: 21.h,
                                  left: 20.w,
                                  right: 20.w,
                                ),
                                child: Column(
                                  children: [
                                    NewsPublicationWidget(
                                      postData: state.favoritesList[index],
                                      isExtended: false,
                                    ),
                                    SizedBox(height: 24.h),
                                    if (index !=
                                        (state.favoritesList.length - 1))
                                      const CustomDividerWidget(),
                                  ],
                                ),
                              );
                            },
                            childCount: state.favoritesList.length,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(top: 32.h),
                            child: const BottomPanelWidget(),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ButtonTryAgainWidget(
                  onPressed: () => _favoriteListBloc.add(
                    GetFromFavoritesListEvent(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
