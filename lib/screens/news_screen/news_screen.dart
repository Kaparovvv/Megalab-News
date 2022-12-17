import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/global_widgets/cached_network_image_widget.dart';
import 'package:megalab_news_app/global_widgets/custom_iconbutton_widget.dart';
import 'package:megalab_news_app/screens/news_screen/local_widgets/filtering_dialog_widget.dart';
import 'package:megalab_news_app/screens/news_screen/local_widgets/news_bar_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 163.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: const NewsBarWidget(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 16.h, right: 20.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CustomIconButtonWidget(
                  iconUrl: IconHelper.filter,
                  color: ThemeHelper.black,
                  size: 24,
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const FilteringDialogWidget(),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              const Expanded(
                child: SingleChildScrollView(
                  child: NewsPublicationWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsPublicationWidget extends StatelessWidget {
  const NewsPublicationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImageWidget(
          imageUrl:
              'https://avatars.mds.yandex.net/i?id=9b35d7bb7062e2b1ecce27a876564227-4835468-images-thumbs&n=13',
          width: 317.w,
          height: 262.h,
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
        TextButton(
          onPressed: () {},
          child: Text(
            'Читать дальше>>',
            style: TextStyleHelper.f16w400.copyWith(
              color: ThemeHelper.color7E5BC2,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        CustomIconButtonWidget(
          onPressed: () {},
          iconUrl: IconHelper.share,
          color: ThemeHelper.color858080,
          size: 24,
        ),
      ],
    );
  }
}
