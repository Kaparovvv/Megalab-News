import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_snackbar.dart';
import 'package:megalab_news_app/core/global_widgets/loading_overlay_widget.dart';

import '../../../../../../utils/dependencies_export.dart';

class DeletePostDialogWidget extends StatelessWidget {
  final int postId;
  const DeletePostDialogWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    DeletePostBloc deletePost = BlocProvider.of(context);
    return Stack(
      children: [
        BlocConsumer<DeletePostBloc, DeletePostState>(
          bloc: deletePost,
          listener: (context, state) {
            if (state is ErrorDeletePostState) {
              showCustomSnackBar(context, state.message);
            }

            if (state is LoadedDeletePostState) {
              Navigator.pop(context);
              context.read<UserDataBloc>().add(GetUserDataEvent());
            }
          },
          builder: (context, state) {
            if (state is LoadingDeletePostState) {
              return const LoadingOverlayWidget();
            }
            return AlertDialog(
              contentPadding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 15.w,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Вы уверены что хотите удалить публикацию?',
                    textAlign: TextAlign.center,
                    style: TextStyleHelper.f16w400,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonWidget(
                        onPressed: () => Navigator.pop(context),
                        width: 100,
                        txtButton: 'Отмена',
                      ),
                      CustomButtonWidget(
                        onPressed: () => deletePost.add(
                          DeleteNewsPostEvent(postId: postId),
                        ),
                        width: 100,
                        txtButton: 'Удалить',
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
