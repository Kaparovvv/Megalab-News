import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final double size;
  const LoadingIndicatorWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: ThemeHelper.color7E5BC2,
      size: size,
    );
  }
}
