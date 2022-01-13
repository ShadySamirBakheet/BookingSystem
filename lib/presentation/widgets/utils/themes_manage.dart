import 'package:booking_system/themes/color.dart';
import 'package:flutter/material.dart';

import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/utils/constants/utils.dart';

class ThemesManage extends StatefulWidget {
  const ThemesManage({Key? key}) : super(key: key);

  @override
  State<ThemesManage> createState() => _ThemesManageState();
}

class _ThemesManageState extends State<ThemesManage> {
  int _chosed = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.conColor6,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 32,
            child: Divider(
              color: AppColor.txtColor4,
              thickness: 2,
            ),
            width: 200,
          ),
          TextView(text: 'ChooseThemeApp'),
          RadioListTile(
            value: 0,
            groupValue: _chosed,
            onChanged: (value) {
              setState(() {
                _chosed = 0;
              });
            },
            title: TextView(
              text: translate('GetThemesFromSystem'),
              textAlign: TextAlign.start,
            ),
          ),
          RadioListTile(
            value: 1,
            groupValue: _chosed,
            onChanged: (value) {
              setState(() {
                _chosed = 1;
              });
            },
            title: TextView(
              text: translate('LightThemeMode'),
              textAlign: TextAlign.start,
            ),
          ),
          RadioListTile(
            value: 2,
            groupValue: _chosed,
            onChanged: (value) {
              setState(() {
                _chosed = 2;
              });
            },
            title: TextView(
              text: translate('DarkThemeMode'),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 16),
          ButtonApp(
            title: translate('Apply'),
            action: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
