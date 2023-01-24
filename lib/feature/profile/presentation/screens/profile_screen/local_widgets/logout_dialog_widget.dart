import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/core/global_widgets/loading_overlay_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/profile/presentation/blocs/logout_bloc/logout_bloc.dart';

import '../../../../../../core/global_widgets/custom_button_widget.dart';
import '../../../../../../core/global_widgets/custom_snackbar.dart';

class LogoutDialogWidget extends StatelessWidget {
  const LogoutDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutBloc logoutBloc = BlocProvider.of(context);
    return Stack(
      children: [
        BlocConsumer<LogoutBloc, LogoutState>(
          bloc: logoutBloc,
          listener: (context, state) {
            if (state is ErrorLogoutState) {
              showCustomSnackBar(context, state.message);
            }
            if (state is LoadedLogoutState) {
              context.router.replaceAll([const SplashScreenRoute()]);
            }
          },
          builder: (context, state) {
            if (state is LoadingLogoutState) {
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
                    'Вы уверены что хотите выйти?',
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
                        txtButton: 'Нет',
                      ),
                      CustomButtonWidget(
                        onPressed: () => logoutBloc.add(UserLogoutEvent()),
                        width: 100,
                        txtButton: 'Выйти',
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
