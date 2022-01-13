import 'package:flutter/material.dart';
import 'package:booking_system/presentation/pages/search/search_page.dart';

import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/color.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';

// ignore: must_be_immutable
class MainAppBar extends StatelessWidget {
  MainAppBar({
    Key? key,
    required this.showMnue,
    required this.isMenu,
  }) : super(key: key);

  bool isOpen = false;
  bool isMenu;
  final Function() showMnue;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 44, left: 16, right: 16, bottom: 16),
      color: AppColor.background1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 30,
                color: AppColor.txtColor1,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: TextView(
                text: translate(isMenu ? 'Settings' : 'SearchSubject'),
                style:
                    AppStyle().textStyle4.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                action: () {
                  isMenu
                      ? null
                      : Navigator.of(context).pushNamed(SearchPage.routeName);
                },
              ),
            ),
            Image.asset(
              'assets/icons/user.png',
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
