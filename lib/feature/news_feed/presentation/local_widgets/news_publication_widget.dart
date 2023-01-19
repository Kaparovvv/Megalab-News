import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/cached_network_image_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/news_feed/domain/entities/post_list_entity.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/local_widgets/show_dialog_box_widget.dart';

class NewsPublicationWidget extends StatelessWidget {
  final bool isExtended;
  final PostListEntity postData;

  const NewsPublicationWidget({
    Key? key,
    required this.isExtended,
    required this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> extendedPublication = [
      CustomIconButtonWidget(
        onPressed: () => context.router.navigateBack(),
        iconUrl: IconHelper.arrowLeft,
        color: ThemeHelper.black,
        size: 41,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Author: ${postData.author}',
            style: TextStyleHelper.f16w400,
          ),
          CustomIconButtonWidget(
            onPressed: () {},
            iconUrl: IconHelper.favourites,
            color: ThemeHelper.black,
            size: 24,
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Text(
        postData.title ?? 'the title of the news is missing',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleHelper.f24w500,
      ),
      SizedBox(height: 8.h),
      Text(
        postData.shortDesc ?? 'the shord description of the news is missing',
        style: TextStyleHelper.f16w400,
      ),
      SizedBox(height: 16.h),
      SizedBox(
        width: 317.w,
        height: 262.h,
        child: CachedNetworkImageWidget(
          imageUrl: postData.image,
          width: 317.w,
          height: 262.h,
        ),
      ),
      SizedBox(height: 16.h),
      Text(
        postData.text ?? 'the text of the news is missing',
        style: TextStyleHelper.f16w400,
      ),
      SizedBox(height: 24.h),
      CustomIconButtonWidget(
        iconUrl: IconHelper.share,
        color: ThemeHelper.color858080,
        size: 24,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const ShowDialogBoxWidget(),
        ),
      ),
    ];
    final List<Widget> briefPublication = [
      SizedBox(
        width: 317.w,
        height: 262.h,
        child: CachedNetworkImageWidget(
          imageUrl: postData.image,
          width: 317.w,
          height: 262.h,
        ),
      ),
      SizedBox(height: 16.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Author: ${postData.author}.',
            style: TextStyleHelper.f16w400,
          ),
          CustomIconButtonWidget(
            onPressed: () {},
            iconUrl: IconHelper.favourites,
            color: ThemeHelper.black,
            size: 24,
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Text(
        postData.title ?? 'the title of the news is missing',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleHelper.f24w500,
      ),
      SizedBox(height: 8.h),
      Text(
        postData.author ?? 'the shord description of the news is missing',
        maxLines: 5,
        style: TextStyleHelper.f16w400,
      ),
      SizedBox(height: 8.h),
      CustomTextButtonWidget(
        onPressed: () => context.router.push(
          NewsScreenRoute(
            postData: postData,
          ),
        ),
        text: 'Читать дальше>>',
        textStyle: TextStyleHelper.f16w400.copyWith(
          color: ThemeHelper.color7E5BC2,
          decoration: TextDecoration.underline,
        ),
      ),
      SizedBox(height: 16.h),
      CustomIconButtonWidget(
        iconUrl: IconHelper.share,
        color: ThemeHelper.color858080,
        size: 24,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const ShowDialogBoxWidget(),
        ),
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isExtended ? extendedPublication : briefPublication,
    );
  }
}
