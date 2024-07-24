import 'package:flutter/material.dart';

class MediaQueryHelper {
  final BuildContext context;

  MediaQueryHelper(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  bool get isLandscape => MediaQuery.of(context).orientation == Orientation.landscape;
  bool get isPortrait => MediaQuery.of(context).orientation == Orientation.portrait;

  double get blockSizeHorizontal => screenWidth / 100;
  double get blockSizeVertical => screenHeight / 100;

  double widthPercentage(double percentage) => blockSizeHorizontal * percentage;
  double heightPercentage(double percentage) => blockSizeVertical * percentage;

  bool get isSmallScreen => screenWidth < 600;
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1200;
  bool get isLargeScreen => screenWidth >= 1200;

  double textScaleFactor(double factor) => MediaQuery.of(context).textScaleFactor * factor;
}
