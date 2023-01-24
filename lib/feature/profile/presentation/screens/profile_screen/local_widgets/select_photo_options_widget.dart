import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/profile_screen/local_widgets/usable_select_photo_btn.dart';

class SelectPhotoOptionsWidget extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const SelectPhotoOptionsWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            SelectPhotoButtonWidget(
              onTap: () => onTap(ImageSource.gallery),
              icon: Icons.image,
              textLabel: 'Использовать галерею',
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'или',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SelectPhotoButtonWidget(
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: 'Использовать камеру',
            ),
          ])
        ],
      ),
    );
  }
}
