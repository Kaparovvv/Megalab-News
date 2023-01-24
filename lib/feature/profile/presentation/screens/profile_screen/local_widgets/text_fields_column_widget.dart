import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/blocs/cubit/edit_button_cubit.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/profile_data_text_field_widget.dart';

class TextFieldsColumnWidget extends StatefulWidget {
  final TextEditingController lastNameController;
  final TextEditingController nameController;
  final TextEditingController nickNameController;
  final String name;
  final String lastName;
  final String nickName;
  final Function() saveUserData;
  final Function() editUserData;

  const TextFieldsColumnWidget({
    super.key,
    required this.lastNameController,
    required this.nameController,
    required this.nickNameController,
    required this.name,
    required this.lastName,
    required this.nickName,
    required this.saveUserData,
    required this.editUserData,
  });

  @override
  State<TextFieldsColumnWidget> createState() => _TextFieldsColumnWidgetState();
}

class _TextFieldsColumnWidgetState extends State<TextFieldsColumnWidget> {
  bool? isReadOnly;
  @override
  void initState() {
    context.read<EditButtonCubit>().editUserdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileDataTextFieldWidget(
            typeTextField: 'Фамилия',
            controller: widget.lastNameController,
            value: widget.lastName,
            readOnly: isReadOnly ?? true,
          ),
          SizedBox(height: 16.h),
          ProfileDataTextFieldWidget(
            typeTextField: 'Имя',
            controller: widget.nameController,
            value: widget.name,
            readOnly: isReadOnly ?? true,
          ),
          SizedBox(height: 16.h),
          ProfileDataTextFieldWidget(
            typeTextField: 'Никнейм',
            controller: widget.nickNameController,
            value: widget.nickName,
            readOnly: isReadOnly ?? true,
          ),
          SizedBox(height: 16.h),
          BlocConsumer<EditButtonCubit, EditButtonState>(
            bloc: context.read<EditButtonCubit>(),
            listener: (context, state) {
              if (state is SaveUserDataState) {
                setState(() {
                  isReadOnly = false;
                });
              }
            },
            builder: (context, state) {
              if (state is SaveUserDataState) {
                return CustomButtonWidget(
                  txtButton: 'Сохранить',
                  onPressed: () => widget.saveUserData(),
                  width: 128.w,
                  height: 38.h,
                );
              }
              if (state is EditUserDataState) {
                return CustomButtonWidget(
                  txtButton: 'Изменить',
                  onPressed: () => widget.editUserData(),
                  width: 128.w,
                  height: 38.h,
                );
              }
              return CustomButtonWidget(
                txtButton: 'Изменить',
                onPressed: () => widget.editUserData(),
                width: 128.w,
                height: 38.h,
              );
            },
          )
        ],
      ),
    );
  }
}
