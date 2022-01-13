import 'dart:io';

import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/color.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppToolBar extends StatelessWidget {
  AppToolBar({
    Key? key,
    required this.showMnue,
    required this.title,
    this.back,
    this.action,
    this.isFirst = false,
    this.subTitle,
  }) : super(key: key);

  bool isOpen = false;
  final Function(BuildContext context) showMnue;
  final Function()? back;
  final String title;
  Widget? action;
  Widget? subTitle;
  bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      color: AppColor.background1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Row(
          children: [
            GestureDetector(
              onTap: isFirst ? back : null,
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  if (!isFirst)
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.txtColor1,
                          size: 20,
                        ),
                      ),
                    ),
                  if (user != null)
                    SizedBox(
                      width: 30,
                      child: CircleAvatar(
                        foregroundImage: FileImage(
                          File(user!.uImage ?? ''),
                        ),
                      ),
                    ),
                  if (user == null)
                    Image.asset(
                      'assets/icons/user.png',
                      width: 30,
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: title,
                      style: AppStyle()
                          .textStyle1
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      padding: const EdgeInsets.all(4),
                    ),
                    subTitle ?? Container(),
                  ],
                ),
              ),
            ),
            action ?? Container(),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => showMnue,
              icon: Icon(
                Icons.menu,
                color: AppColor.txtColor1,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
