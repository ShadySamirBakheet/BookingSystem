import 'package:booking_system/data/models/utils/bottom_bar_item.dart';
import 'package:booking_system/presentation/pages/bnb_pages/home_bnb_page.dart';
import 'package:booking_system/presentation/pages/bnb_pages/hotels_bnb_page.dart';
import 'package:booking_system/presentation/pages/bnb_pages/setting_bnb_page.dart';
import 'package:booking_system/presentation/widgets/home/app_tool_bar.dart';
import 'package:booking_system/presentation/widgets/home/bottom_bar.dart';
import 'package:booking_system/themes/color.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _title = translate('Home');
  List<BottomBarData> items = [
    BottomBarData(
      title: translate('Home'),
      iconData: 'assets/icons/home.png',
      badgeColor: AppColor.bottomHome,
    ),
    BottomBarData(
      title: translate('Hotel'),
      iconData: 'assets/icons/hotel.png',
      badgeColor: AppColor.bottomSaved,
    ),
    BottomBarData(
      title: translate('Menu'),
      iconData: 'assets/icons/menu.png',
      badgeColor: AppColor.bottomMenu,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppToolBar(
              showMnue: (context) {},
              title: _title,
              isFirst: true,
            ),
            _getPageByIndex(_selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar: BubbleBottomBarApp(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
        items: items,
      ),
    );
  }

  void _onItemTapped(int? value) {
    setState(() {
      _selectedIndex = value ?? 0;
      _title = items[_selectedIndex].title;
    });
  }

  _getPageByIndex(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const HomeBNBPage();
      case 1:
        return const HotelsBNBPage();
      case 2:
        return const SettingsBNBPage();
      default:
        return const HomeBNBPage();
    }
  }

  void changePage(int? value) {}
}
