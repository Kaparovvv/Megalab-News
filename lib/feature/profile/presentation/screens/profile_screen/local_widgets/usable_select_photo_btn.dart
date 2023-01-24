import 'package:flutter/material.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

class SelectPhotoButtonWidget extends StatelessWidget {
  final String textLabel;
  final IconData icon;

  final void Function()? onTap;

  const SelectPhotoButtonWidget({
    Key? key,
    required this.textLabel,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeHelper.color7E5BC2,
        elevation: 10,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 6,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ThemeHelper.white,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(textLabel,
                style:
                    TextStyleHelper.f16w400.copyWith(color: ThemeHelper.white))
          ],
        ),
      ),
    );
  }
}
