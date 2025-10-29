import 'package:flutter/material.dart';

class ColorManager {
  static const Color darkGray = Color(0xFF1E1E1E);
  static const Color lightGray = Color(0xFF828282);
  static const Color backgroundColorTextField = Color(0xffECECEC);

  static const LinearGradient primaryColorGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      lightGray,
      darkGray
    ],
  );
}
