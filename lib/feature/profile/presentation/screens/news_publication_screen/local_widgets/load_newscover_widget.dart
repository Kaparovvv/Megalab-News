import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:megalab_news_app/commons/icon_helper.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/profile_photo_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/select_photo_options_widget.dart';

class LoadNewsCoverWidget extends StatefulWidget {
  final FileCallback callback;
  const LoadNewsCoverWidget({super.key, required this.callback});

  @override
  State<LoadNewsCoverWidget> createState() => _LoadNewsCoverWidgetState();
}

class _LoadNewsCoverWidgetState extends State<LoadNewsCoverWidget> {
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
        Text(
          'Обложка новости',
          style: TextStyleHelper.f16w400.copyWith(color: ThemeHelper.black),
        ),
        SizedBox(height: 8.h),
        InkWell(
          child: Container(
            width: 130,
            height: 33,
            decoration: BoxDecoration(
              border: Border.all(
                color: _image != null
                    ? ThemeHelper.color7E5BC2
                    : ThemeHelper.colorDEDCE4,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 15,
            ),
            child: _image != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Загружено',
                        style: TextStyleHelper.f14w500
                            .copyWith(color: ThemeHelper.color7E5BC2),
                      ),
                      const ImageIcon(
                        AssetImage(IconHelper.checkbox),
                        color: ThemeHelper.color7E5BC2,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Загрузить',
                        style: TextStyleHelper.f14w400,
                      ),
                      const ImageIcon(
                        AssetImage(IconHelper.download),
                        color: ThemeHelper.black,
                      ),
                    ],
                  ),
          ),
          onTap: () {
            _showSelectPhotoOptions(context);
          },
        ),
      ],
    );
  }
}
