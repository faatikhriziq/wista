import 'package:flutter/material.dart';

extension ScreenExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get blockSizeHorizontal => screenWidth / 100;
  double get blockSizeVertical => screenHeight / 100;
  double get paddingTop => MediaQuery.of(this).padding.top;
}
