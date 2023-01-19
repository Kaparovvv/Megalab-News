import 'package:flutter/material.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final double? edgeOffset;
  const RefreshIndicatorWidget({
    Key? key,
    required this.child,
    required this.onRefresh,
    this.edgeOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: edgeOffset ?? 0.0,
      onRefresh: () async => onRefresh(),
      color: ThemeHelper.color7E5BC2,
      child: child,
    );
  }
}
