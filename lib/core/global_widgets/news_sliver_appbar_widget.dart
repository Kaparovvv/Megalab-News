import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/uppercontrolpanel_widget.dart';

// ignore: must_be_immutable
class NewsSliverAppBarWidget extends StatefulWidget {
  ScrollController scrollController;
  final bool isSearchButton;
  final Function() onSearch;
  NewsSliverAppBarWidget({
    Key? key,
    required this.scrollController,
    required this.isSearchButton,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<NewsSliverAppBarWidget> createState() => _NewsSliverAppBarWidgetState();
}

class _NewsSliverAppBarWidgetState extends State<NewsSliverAppBarWidget> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;

  bool? isFlexibleSpace;

  @override
  void initState() {
    super.initState();
    isFlexibleSpace = true;
    _scrollListen();
  }

  void _scrollListen() {
    widget.scrollController.addListener(() {
      _isAppBarExpanded
          ? isFlexibleSpace != false
              ? callingSetState(false)
              : {}
          : isFlexibleSpace != true
              ? callingSetState(true)
              : {};
    });
  }

  bool get _isAppBarExpanded {
    return widget.scrollController.hasClients &&
        widget.scrollController.offset > (100 - kToolbarHeight);
  }

  callingSetState(bool isBool) {
    if (mounted) {
      setState(() {
        isFlexibleSpace = isBool;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: _pinned,
      snap: _snap,
      floating: _floating,
      expandedHeight: 163.h,
      automaticallyImplyLeading: false,
      backgroundColor: ThemeHelper.color151515,
      stretch: true,
      title: UpperControlPanelWidget(
        theme: ThemeHelper.white,
        isSearchButton: widget.isSearchButton,
        onSearch: () => widget.onSearch(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: isFlexibleSpace!
              ? TextStyleHelper.f42w500
              : TextStyleHelper.colorTransparent,
          child: const Text('Новости'),
        ),
        background: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesHelper.newsBackground),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
