import 'package:flutter/material.dart';

class ResColor{
  static final tabSelect = Color(0xff000000);
  static final tabUnSelect = Colors.black54;
  static final white = Color(0xffffffff);
  static final grey50 = Color(0xfffafafa);
  static final grey100 = Color(0xfff5f5f5);
  static final grey200 = Color(0xffeeeeee);
  static final grey300 = Color(0xffe0e0e0);
  static final grey400 = Color(0xffbdbdbd);
  static final grey500 = Color(0xff9e9e9e);
  static final grey600 = Color(0xff757575);
  static final grey700 = Color(0xff616161);
  static final dividerLine = Color.fromARGB(12, 6, 6, 6);
  static final button_unable = Color.fromARGB(120, 255, 255, 255);
  static final button_enable = Color.fromARGB(255, 255, 255, 255);
  static final toastbgcolor = Color(0xcc000000);
  static final blue_700 = Color(0xff1976d2);

  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  static Color hexColor(int hex,{double alpha = 1}){
    if (alpha < 0){
      alpha = 0;
    }else if (alpha > 1){
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16 ,
        (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0,
        alpha);
  }
}