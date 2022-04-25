


import 'package:flutter/material.dart';

class ResponsiveManager {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth=0;
  static double screenHeight=0;
  static double defaultSize=0;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    defaultSize=_mediaQueryData.size.width/375;
  }
}

extension Responsive on double {
  ///!------------- get height from screen height
  double get h {
    double digit  = this;
    double height = (digit / 812.0) * ResponsiveManager.screenHeight;
    return height;
  }
  ///!------------- get Width from screen Width
  double get w {
    double digit  = this;
    double width = (digit / 375.0) * ResponsiveManager.screenWidth;
    return width;
  }

  double get sh {
    return this*ResponsiveManager.screenHeight;
  }
  ///!------------- screen Width
  double get sw {
    return this*ResponsiveManager.screenWidth;
  }

  Orientation get orientation {
    return ResponsiveManager.orientation;
  }
}


