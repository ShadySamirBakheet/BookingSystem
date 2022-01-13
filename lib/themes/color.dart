import 'package:flutter/material.dart';
import 'package:booking_system/utils/constants/values.dart';

class AppColor {
  static Color transparent = Colors.transparent;
  static Color black = Colors.black;
  static Color white = Colors.white;

  ////Text Color
  static Color txtColor1 = isDark ? Colors.white : Colors.black;
  static Color txtColor2 = isDark ? Colors.black : Colors.white;
  static Color txtColor3 = const Color(0xff223c8c);
  static Color txtColor4 = const Color(0xff828282);
  static Color txtColor5 = const Color(0xffFF0000);

  /////container
  static Color conColor1 = const Color(0xff066ab2);
  static Color conColor2 = const Color(0xffffffff);
  static Color conColor3 = const Color(0xffd5d5d5);
  static Color conColor3l = const Color(0xffECEDEF);
  static Color conColor4 = const Color(0xffFF0000);
  static Color conColor4l = const Color(0xffFF00bc);
  static Color conColor5 = const Color(0xff066ab2);
  static Color conColor6 = const Color(0xFFA1E4FF);

  /////
  static Color btnColor1 = const Color(0xff2147BD);
  static Color btnColor2 = const Color(0xffffffff);
  static Color btnColor3 = const Color(0xffd5d5d5);
  static Color btnColor4 = const Color(0xED13AE0C);

  ///
  static Color lineColor = const Color(0xffd5d5d5);

  ////
  static Color background1 =
      isDark ? const Color(0xFF303030) : const Color(0xffffffff);
  static Color background =
      isDark ? const Color(0xFF424242) : const Color(0xfff1f1f1);

  /////

  static Color spinner = const Color(0xffBFBFBF);

  /////
  static Color loginColor1 = const Color(0xffB1E5FF);
  static Color loginColor2 = const Color(0xff43B0E6);
  static Color startColor = const Color(0xBAB7E7FF);

  /////
  static Color statusBarColor = const Color(0xff43B0E6);
  static Color appBarColor = const Color(0xDA43B0E6);
  static Color bottomBar = const Color(0xff066ab2);

  /////
  static Color boxColor = const Color(0xff0094FF);

  // bottom bar
  static Color bottomHome = const Color(0xFFFF008C);
  static Color bottomSaved = const Color(0xFFFF0000);
  static Color bottomMenu = const Color(0xFFBD0404);
}
