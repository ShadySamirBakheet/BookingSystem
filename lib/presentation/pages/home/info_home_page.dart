import 'dart:async';

import 'package:booking_system/data/models/utils/slider_info.dart';
import 'package:booking_system/presentation/pages/login_system/login_page.dart';
import 'package:booking_system/presentation/widgets/home/item_page_info.dart';
import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/indicator.dart';
import 'package:booking_system/utils/constants/utils.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoHomePage extends StatefulWidget {
  const InfoHomePage({Key? key}) : super(key: key);

  static const routeName = '/info-home';
  @override
  _InfoHomePageState createState() => _InfoHomePageState();
}

class _InfoHomePageState extends State<InfoHomePage> {
  int postion = 0;
  final pageIndexNotifier = ValueNotifier<int>(0);

  final List<DataModel> data = [
    DataModel(
      title: translate('appName'),
      desc: translate('appDesc1'),
      imageUrl: 'assets/icons/searching.png',
    ),
    DataModel(
      title: translate('appName'),
      desc: translate('appDesc2'),
      imageUrl: 'assets/icons/booking.png',
    ),
    DataModel(
      title: translate('appName'),
      desc: translate('appDesc3'),
      imageUrl: 'assets/icons/room.png',
    ),
    DataModel(
      title: translate('appName'),
      desc: translate('appDesc4'),
      imageUrl: 'assets/icons/discount.png',
    )
  ];

  var pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (postion < 3) {
        postion++;
        pageController.animateToPage(postion,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              postion = index;

              if (postion == 3) {
                Future.delayed(const Duration(seconds: 5), () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setBool('isFirst', true);

                  goNext(context);
                });
              }
            });
            pageIndexNotifier.value = index;
          },
          children: data
              .map((dataModel) => ItemPageView(dataModel: dataModel))
              .toList(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5 * 4,
            ),
            ButtonApp(
              title: translate('GetStart'),
              action: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setBool('isFirst', true);

                goNext(context);
              },
            ),
          ],
        ),
        Align(
          alignment: const Alignment(0, 0.65),
          child: Indicator(size: data.length, current: postion),
        ),
        //_buildExample1(),

        // _buildExample3(),
      ]),
    );
  }

  void goNext(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  }
}
