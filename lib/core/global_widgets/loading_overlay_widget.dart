import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class LoadingOverlayWidget extends StatelessWidget {
  const LoadingOverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Opacity(
          opacity: 0.4,
          child: ModalBarrier(
            dismissible: false,
            color: ThemeHelper.color7E5BC2,
          ),
        ),
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: ThemeHelper.white,
            size: 50,
          ),
        ),
      ],
    );
  }
}
