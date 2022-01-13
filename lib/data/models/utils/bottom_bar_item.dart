import 'package:flutter/widgets.dart';

class BottomBarData {
  String title;
  String iconData;
  bool isBadge;
  int badge;
  Color badgeColor;
  BottomBarData({
    required this.title,
    required this.iconData,
    required this.badgeColor,
    this.isBadge = false,
    this.badge = 0,
  });
}
