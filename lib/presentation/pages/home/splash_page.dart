import 'dart:async';

import 'package:booking_system/business_logic/cubit/user_cubit.dart';
import 'package:booking_system/data/models/users/user.dart';
import 'package:booking_system/presentation/pages/home/info_home_page.dart';
import 'package:booking_system/presentation/pages/login_system/login_page.dart';
import 'package:booking_system/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:booking_system/presentation/pages/home/home_page.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';

  SplashPage({Key? key}) : super(key: key);

  bool isFirst = false;
  bool isLogin = false;

  getIsFirst(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isFirst = sharedPreferences.getBool('isFirst') ?? false;
    isLogin = sharedPreferences.getBool('isLogin') ?? false;

    int uid = sharedPreferences.getInt('uid') ?? 0;
    BlocProvider.of<UserCubit>(context).getUseeFun(uid);
  }

  @override
  Widget build(BuildContext context) {
    getIsFirst(context);
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        goNext(context);
        timer.cancel();
      },
    );

    return Scaffold(body: BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLogin) {
          user = state.user;
        }
        return _widgetView(context);
      },
    ));
  }

  Center _widgetView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/icon.png',
            width: 150,
          ),
          const SizedBox(
            height: 35,
          ),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 35,
          ),
          SkeletonAnimation(
            shimmerColor: Colors.white,
            borderRadius: BorderRadius.circular(32),
            shimmerDuration: 1000,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
                //boxShadow: shadowList,
              ),
              child: Text(
                translate(
                  'WelcomeDear',
                ),
                style: AppStyle().textStyle2.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  goNext(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(isFirst
          ? (isLogin ? HomePage.routeName : LoginPage.routeName)
          : InfoHomePage.routeName);
}
