import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/core/global_widgets/cached_network_image_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/select_photo_options_widget.dart';

typedef FileCallback = void Function(File? profileImage);

class ProfilePhotoWidget extends StatefulWidget {
  final FileCallback callback;
  final String? imageUrl;
  final void Function() deleteImage;
  const ProfilePhotoWidget({
    Key? key,
    required this.imageUrl,
    required this.callback,
    required this.deleteImage,
  }) : super(key: key);

  @override
  State<ProfilePhotoWidget> createState() => _ProfilePhotoWidgetState();
}

class _ProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
        widget.callback(_image);
      });
    } on PlatformException {
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.28,
        maxChildSize: 0.4,
        minChildSize: 0.28,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SelectPhotoOptionsWidget(
              onTap: _pickImage,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 125.w,
          height: 125.h,
          child: CachedNetworkImageWidget(
            isRadius: false,
            imageUrl: widget.imageUrl,
            width: 125.w,
            height: 125.h,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 14.h),
        textButton(
          'Добавить фото',
          IconHelper.download,
          ThemeHelper.black,
          onTap: () {
            _showSelectPhotoOptions(context);
          },
        ),
        SizedBox(height: 14.h),
        textButton(
          'Удалить',
          IconHelper.delete,
          ThemeHelper.colorA01313,
          onTap: () => widget.deleteImage(),
        ),
      ],
    );
  }

  InkWell textButton(String title, String icon, Color theme,
      {Function()? onTap}) {
    return InkWell(
      onTap: () => onTap!(),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyleHelper.f14w400,
          ),
          SizedBox(width: 8.h),
          Image.asset(
            width: 16.w,
            height: 16.h,
            icon,
            color: theme,
          ),
        ],
      ),
    );
  }
}
