import 'dart:developer';

import 'package:flutter/material.dart';

class SizeManager {
  final BuildContext _context;
  double? _screenHeight;
  double? _screenWidth;

  SizeManager(this._context) {
    _screenHeight = (MediaQuery.of(_context).size.height);
    _screenWidth = (MediaQuery.of(_context).size.width);
  }

  double scaledHeight(double value) {
    log('value / _screenWidth ======== ${(value / _screenHeight!)}');
    double height =
        MediaQuery.of(_context).size.height * (value / _screenHeight!);

    return height;
  }

  double scaledWidth(double value) {
    log('value / _screenHeight ======== ${(value / _screenHeight!)}');
    double width = MediaQuery.of(_context).size.width * (value / _screenWidth!);
    return width;
  }
}
