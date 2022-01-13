import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:booking_system/data/models/utils/bottom_bar_item.dart';

class BubbleBottomBarApp extends StatelessWidget {
  final Function(int? val) onItemTapped;
  final int selectedIndex;
  final List<BottomBarData> items;

  const BubbleBottomBarApp({
    Key? key,
    required this.onItemTapped,
    required this.selectedIndex,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,

      hasNotch: true, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Colors.black12, //optional, uses theme color if not specified
      items: <BubbleBottomBarItem>[...items.map((e) => _getItem(e)).toList()],
    );
  }

  BubbleBottomBarItem _getItem(BottomBarData e) {
    return BubbleBottomBarItem(
      showBadge: e.isBadge,
      badge: e.isBadge
          ? Text(
              '${e.badge}',
              style: const TextStyle(color: Colors.white, fontSize: 10),
            )
          : Container(),
      badgeColor: Colors.grey.shade600,
      backgroundColor: Colors.red,
      icon: ImageIcon(
        AssetImage(e.iconData),
        color: Colors.grey.shade800,
      ),
      activeIcon: ImageIcon(
        AssetImage(e.iconData),
        color: e.badgeColor,
      ),
      title: Text(e.title),
    );
  }
}
