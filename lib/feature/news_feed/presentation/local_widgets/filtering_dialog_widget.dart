import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_snackbar.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/checkbox_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/state_blocs/checkbox_cubit/checkbox_cubit.dart';
import 'package:megalab_news_app/utils/dependencies_export.dart';

class FilteringDialogWidget extends StatefulWidget {
  final List<String> listOfTag;
  const FilteringDialogWidget({super.key, required this.listOfTag});

  @override
  State<FilteringDialogWidget> createState() => _FilteringDialogWidgetState();
}

class _FilteringDialogWidgetState extends State<FilteringDialogWidget> {
  bool isCheckbox = false;

  @override
  Widget build(BuildContext context) {
    TagListBloc tagListBloc = BlocProvider.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.only(
        top: 20.h,
        bottom: 27.h,
        left: 27.w,
        right: 27.w,
      ),
      content: BlocConsumer<TagListBloc, TagListState>(
        bloc: tagListBloc,
        listener: (context, state) {
          if (state is ErrorTagListState) {
            showCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is LoadingTagListState) {
            return const Center(
              child: LoadingIndicatorWidget(size: 30),
            );
          }
          if (state is ErrorTagListState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    'Не удалось загрузить данные, повторите попытку',
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.f16w400.copyWith(
                      color: ThemeHelper.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomButtonWidget(
                  txtButton: 'Повторить',
                  onPressed: () => tagListBloc.add(GetTagListEvent()),
                  width: 168.w,
                ),
              ],
            );
          }
          if (state is LoadedTagListState) {
            var tagList = state.tagList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Фильтрация',
                  style: TextStyleHelper.f18w500,
                ),
                SizedBox(height: 17.h),
                tagList.isNotEmpty
                    ? SizedBox(
                        height: 400.h,
                        width: 250.w,
                        child: ListView.separated(
                          itemCount: tagList.length,
                          itemBuilder: (context, index) {
                            var tag = tagList[index].name!;
                            return Row(
                              children: [
                                BlocProvider(
                                  create: (context) => CheckboxCubit(),
                                  child: CheckboxWidget(
                                    tag: tag,
                                    listOfTag: widget.listOfTag,
                                  ),
                                ),
                                SizedBox(width: 18.h),
                                SizedBox(
                                  width: 140.w,
                                  child: Text(
                                    tagList[index].name ?? 'unknown',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    style: TextStyleHelper.f16w400.copyWith(
                                      color: ThemeHelper.black,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 14.h),
                        ),
                      )
                    : Center(
                        child: Text(
                          'Список тэгов пуст',
                          style: TextStyleHelper.f16w400.copyWith(
                            color: ThemeHelper.black,
                          ),
                        ),
                      ),
                SizedBox(height: 25.5.h),
                Align(
                  alignment: Alignment.center,
                  child: CustomButtonWidget(
                    txtButton: tagList.isNotEmpty ? 'Применить' : 'Назад',
                    onPressed: () async {
                      log(widget.listOfTag.toString());
                      if (widget.listOfTag.isNotEmpty) {
                        context.read<PostBloc>().add(
                              GetPostListByTagEvent(
                                tags: widget.listOfTag.join(","),
                              ),
                            );
                        context.router.pop();
                      } else {
                        context.router.pop();
                      }
                    },
                    width: 168.w,
                  ),
                ),
              ],
            );
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.w,
                child: Text(
                  'Не удалось загрузить данные, повторите попытку',
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.f16w400.copyWith(
                    color: ThemeHelper.black,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButtonWidget(
                txtButton: 'Повторить',
                onPressed: () => tagListBloc.add(GetTagListEvent()),
                width: 168.w,
              ),
            ],
          );
        },
      ),
    );
  }
}
