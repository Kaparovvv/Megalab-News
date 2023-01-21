import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';

import '../state_blocs/checkbox_cubit/checkbox_cubit.dart';

class CheckboxWidget extends StatefulWidget {
  final String tag;
  final List<String> listOfTag;
  const CheckboxWidget({
    super.key,
    required this.tag,
    required this.listOfTag,
  });

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var listOfTag = widget.listOfTag;
    var tag = widget.tag;
    var cubit = context.read<CheckboxCubit>();
    return BlocBuilder<CheckboxCubit, CheckboxState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is CheckedState) {
          return CustomIconButtonWidget(
            onPressed: () {
              if (listOfTag.contains(tag) == true) {
                listOfTag.remove(tag);
                cubit.unchecked();
              }
            },
            iconUrl: IconHelper.checkbox,
            color: ThemeHelper.color7E5BC2,
            size: 30,
          );
        }

        if (state is UncheckedState) {
          return CustomIconButtonWidget(
            onPressed: () {
              if (listOfTag.contains(tag) == false) {
                cubit.checked();
                log(listOfTag.toString());
              }
            },
            iconUrl: IconHelper.unchecked,
            color: ThemeHelper.black,
            size: 30,
          );
        }

        return listOfTag.contains(tag)
            ? CustomIconButtonWidget(
                onPressed: () {
                  if (listOfTag.contains(tag) == true) {
                    listOfTag.remove(tag);
                    cubit.unchecked();
                  }
                },
                iconUrl: IconHelper.checkbox,
                color: ThemeHelper.color7E5BC2,
                size: 30,
              )
            : CustomIconButtonWidget(
                onPressed: () {
                  if (listOfTag.contains(tag) == false) {
                    listOfTag.add(tag);
                    cubit.checked();
                  }
                },
                iconUrl: IconHelper.unchecked,
                color: ThemeHelper.black,
                size: 30,
              );
      },
    );
  }
}
