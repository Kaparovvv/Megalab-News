import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/tag_list_entity.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/news_publication_screen/local_widgets/selected_category_widget.dart';

import '../../../../../../core/global_widgets/custom_snackbar.dart';
import '../../../../../../utils/dependencies_export.dart';

typedef StringCallback = void Function(String? tag);

class CategoryDropDownWidget extends StatefulWidget {
  final String title;
  final double width;
  final double height;
  final TextStyle textStyle;
  final StringCallback callback;

  const CategoryDropDownWidget({
    super.key,
    required this.width,
    required this.height,
    required this.textStyle,
    required this.title,
    required this.callback,
  });

  @override
  State<CategoryDropDownWidget> createState() => _CategoryDropDownWidget();
}

class _CategoryDropDownWidget extends State<CategoryDropDownWidget> {
  TagListEntity? _selectedLocation;
  late TagListBloc _tagListBloc;

  @override
  void initState() {
    _tagListBloc = BlocProvider.of(context);
    _tagListBloc.add(GetTagListEvent());
    super.initState();
  }

  List<String> tagList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TagListBloc, TagListState>(
      bloc: _tagListBloc,
      listener: (context, state) {
        if (state is ErrorTagListState) {
          showCustomSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LoadedTagListState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
              ),
              SizedBox(height: 8.h),
              Container(
                width: widget.width.w,
                height: widget.height.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ThemeHelper.colorDEDCE4),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 10.w,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: const Icon(Icons.expand_more),
                    iconSize: 24,
                    iconEnabledColor: ThemeHelper.color858080,
                    dropdownColor: ThemeHelper.white,
                    style: TextStyleHelper.f16w400
                        .copyWith(color: ThemeHelper.black),
                    hint: Text(
                      "Не выбрано",
                      style: widget.textStyle,
                    ),
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                        widget.callback(newValue!.name);
                      });
                    },
                    items: state.tagList.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.name ?? 'unknown',
                          style: widget.textStyle,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SelectedCategoryWidget(
                category: _selectedLocation != null
                    ? '${_selectedLocation!.name}'
                    : 'не выбрано',
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
            ),
            SizedBox(height: 8.h),
            Container(
              width: widget.width.w,
              height: widget.height.h,
              decoration: BoxDecoration(
                border: Border.all(color: ThemeHelper.colorDEDCE4),
                borderRadius: BorderRadius.circular(5.r),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 10.w,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: const Icon(Icons.expand_more),
                  iconSize: 24,
                  iconEnabledColor: ThemeHelper.color858080,
                  dropdownColor: ThemeHelper.white,
                  style: TextStyleHelper.f16w400
                      .copyWith(color: ThemeHelper.black),
                  hint: Text(
                    "Не выбрано",
                    style: widget.textStyle,
                  ),
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = TagListEntity();
                    });
                  },
                  items: tagList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: widget.textStyle,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            const SelectedCategoryWidget(
              category: 'не выбрано',
            ),
          ],
        );
      },
    );
  }
}
