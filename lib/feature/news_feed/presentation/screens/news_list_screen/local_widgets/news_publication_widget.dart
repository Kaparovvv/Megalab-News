import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/cached_network_image_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_textbutton_widget.dart';
import 'package:megalab_news_app/feature/news_feed/presentation/screens/news_list_screen/local_widgets/show_dialog_box_widget.dart';

class NewsPublicationWidget extends StatelessWidget {
  final bool isExtended;
  final Function() onPressed;
  const NewsPublicationWidget({
    Key? key,
    required this.isExtended,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> extendedPublication = [
      CustomIconButtonWidget(
        onPressed: () => onPressed(),
        iconUrl: IconHelper.arrowLeft,
        color: ThemeHelper.black,
        size: 41,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '29.11.2022',
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
        'Заголовок новости',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleHelper.f24w500,
      ),
      SizedBox(height: 8.h),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
        style: TextStyleHelper.f16w400,
      ),
      SizedBox(height: 16.h),
      SizedBox(
        width: 317.w,
        height: 262.h,
        child: CachedNetworkImageWidget(
          imageUrl:
              'https://avatars.mds.yandex.net/i?id=9b35d7bb7062e2b1ecce27a876564227-4835468-images-thumbs&n=13',
          width: 317.w,
          height: 262.h,
        ),
      ),
      SizedBox(height: 16.h),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti',
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
          imageUrl:
              'https://avatars.mds.yandex.net/i?id=9b35d7bb7062e2b1ecce27a876564227-4835468-images-thumbs&n=13',
          width: 317.w,
          height: 262.h,
        ),
      ),
      SizedBox(height: 16.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '29.11.2022',
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
        'Заголовок новости',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyleHelper.f24w500,
      ),
      SizedBox(height: 8.h),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
        maxLines: 5,
        style: TextStyleHelper.f16w400,
      ),
      SizedBox(height: 8.h),
      CustomTextButtonWidget(
        onPressed: () => onPressed(),
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
