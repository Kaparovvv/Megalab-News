import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:megalab_news_app/commons/images_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    Key? key,
    this.isRadius = true,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.radius,
    this.shape,
  }) : super(key: key);
  final bool isRadius;
  final String? imageUrl;
  final double width;
  final double height;
  final BorderRadius? radius;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://megalab.pythonanywhere.com${imageUrl ?? '/media/post_image/image.png'}',
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: isRadius ? radius : null,
          shape: shape ?? BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: ThemeHelper.blueGrey,
            shape: shape ?? BoxShape.rectangle,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        ImagesHelper.imageNotFound,
        fit: BoxFit.cover,
      ),
    );
  }
}
