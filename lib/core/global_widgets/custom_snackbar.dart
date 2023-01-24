import 'package:flutter/material.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';

showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.up,
      content: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ThemeHelper.color7E5BC2,
          boxShadow: const [
            BoxShadow(
              color: ThemeHelper.color5A5A5A,
              offset: Offset(2, 2),
              blurRadius: 15,
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 230,
              child: Text(
                message,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.f16w500.copyWith(
                  color: ThemeHelper.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeHelper.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(0),
              ),
              child: Text(
                'OK',
                style: TextStyleHelper.f18w500.copyWith(
                  color: ThemeHelper.color7E5BC2,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
