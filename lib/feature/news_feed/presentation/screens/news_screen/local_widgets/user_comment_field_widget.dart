import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textfield_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_screen/state_blocs/cubit/commenting_cubit.dart';

class UserCommentFieldWidget extends StatelessWidget {
  const UserCommentFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Вы',
          style: TextStyleHelper.f18w500,
        ),
        CustomTextFieldWidget(
          constraints: BoxConstraints(maxHeight: 27.h, maxWidth: 198.w),
          controller: TextEditingController(),
        ),
        CustomButtonWidget(
          onPressed: () => context.read<CommentingCubit>().cancelReply(),
          width: 37,
          height: 27,
          isChildText: false,
          iconUrl: IconHelper.arrowUp,
        ),
      ],
    );
  }
}
