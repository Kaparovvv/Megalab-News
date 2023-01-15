import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/uppercontrolpanel_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const UpperControlPanelWidget(theme: ThemeHelper.color7E5BC2),
      ),
      body: SafeArea(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfilePhotoWidget(),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileDataTextFieldWidget(
                              typeTextField: 'Фамилия',
                              controller: TextEditingController(),
                              value: 'Олегов',
                            ),
                            SizedBox(height: 16.h),
                            ProfileDataTextFieldWidget(
                              typeTextField: 'Имя',
                              controller: TextEditingController(),
                              value: 'Олег',
                            ),
                            SizedBox(height: 16.h),
                            ProfileDataTextFieldWidget(
                              typeTextField: 'Никнейм',
                              controller: TextEditingController(),
                              value: 'oleg.olegov',
                            ),
                            SizedBox(height: 16.h),
                            CustomButtonWidget(
                              txtButton: 'Сохранить',
                              onPressed: () {},
                              width: 128.w,
                              height: 38.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Мои публикации',
                        style: TextStyleHelper.f24w500,
                      ),
                      SizedBox(
                        width: 65.w,
                        height: 38.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeHelper.color7E5BC2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // ListView.separated(
            //     itemBuilder: () {},
            //     separatorBuilder: ,
            //     itemCount: itemCount)
          ],
        ),
      ),
    );
  }
}

class ProfileDataTextFieldWidget extends StatefulWidget {
  final String typeTextField;
  final TextEditingController controller;
  final String? value;
  const ProfileDataTextFieldWidget({
    Key? key,
    required this.typeTextField,
    required this.controller,
    this.value,
  }) : super(key: key);
  @override
  State<ProfileDataTextFieldWidget> createState() =>
      _ProfileDataTextFieldWidgetState();
}

class _ProfileDataTextFieldWidgetState
    extends State<ProfileDataTextFieldWidget> {
  @override
  void initState() {
    widget.controller.text = widget.value ?? 'unknown';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.typeTextField,
          style: TextStyleHelper.f14w400,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 170.w,
          height: 38.h,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.left,
            style: TextStyleHelper.f14w500.copyWith(decorationThickness: 0),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 0.5.h,
                horizontal: 12.w,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage(IconHelper.edit),
                  size: 16,
                  color: ThemeHelper.color5A5A5A,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: ThemeHelper.colorE4DFDC),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: ThemeHelper.blueAccent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: ThemeHelper.red),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 62.5.r,
          backgroundColor: ThemeHelper.colorE8E8E8,
          child: Image.asset(
            width: 72.w,
            height: 72.h,
            ImagesHelper.emptyPicture,
          ),
        ),
        SizedBox(height: 14.h),
        textButton(
          'Добавить фото',
          IconHelper.download,
          ThemeHelper.black,
          onTap: () {},
        ),
        SizedBox(height: 14.h),
        textButton(
          'Удалить',
          IconHelper.delete,
          ThemeHelper.colorA01313,
          onTap: () {},
        ),
      ],
    );
  }

  InkWell textButton(String title, String icon, Color theme,
      {Function()? onTap}) {
    return InkWell(
      onTap: () => onTap!(),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyleHelper.f14w400,
          ),
          SizedBox(width: 8.h),
          Image.asset(
            width: 16.w,
            height: 16.h,
            icon,
            color: theme,
          ),
        ],
      ),
    );
  }
}
