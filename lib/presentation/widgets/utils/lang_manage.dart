import 'package:booking_system/themes/color.dart';
import 'package:booking_system/utils/constants/values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/utils/constants/utils.dart';

class LanguageManage extends StatefulWidget {
  const LanguageManage({Key? key}) : super(key: key);

  @override
  State<LanguageManage> createState() => _LanguageManageState();
}

class _LanguageManageState extends State<LanguageManage> {
  int _chosed = isEn ? 0 : 1;
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
          TextView(text: translate('ChooseLanguageApp')),
          RadioListTile(
            value: 0,
            groupValue: _chosed,
            onChanged: (value) {
              setState(() {
                _chosed = 0;
              });
            },
            title: TextView(
              text: 'English',
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
              text: 'عربي',
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 16),
          ButtonApp(
            title: translate('Apply'),
            action: () {
              setState(() {
                isEn = _chosed == 0;
              });
              if (_chosed == 0) {
                EasyLocalization.of(context)!.setLocale(const Locale('en'));
              } else {
                EasyLocalization.of(context)!.setLocale(const Locale('ar'));
              }
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
