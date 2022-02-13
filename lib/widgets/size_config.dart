import 'package:flutter/widgets.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  static double deviceWidth = 0.0;
  static double deviceHeight = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    deviceWidth = _mediaQueryData.size.width;
    deviceHeight = _mediaQueryData.size.height;
  }
}
