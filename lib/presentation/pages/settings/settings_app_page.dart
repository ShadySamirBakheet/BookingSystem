import 'package:flutter/material.dart';
import 'package:booking_system/presentation/widgets/home/app_tool_bar.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/color.dart';
import 'package:booking_system/utils/constants/utils.dart';

class SetingsAppPage extends StatefulWidget {
  const SetingsAppPage({Key? key}) : super(key: key);

  static const routeName = '/setting';

  @override
  _SetingsAppPageState createState() => _SetingsAppPageState();
}

class _SetingsAppPageState extends State<SetingsAppPage> {
  bool _value = true;
  String? _groupValue = 'value1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppToolBar(
              showMnue: (context) {},
              title: translate('SettingsApp'),
              back: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  Card(
                    elevation: 0,
                    color: AppColor.background1,
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextView(
                        text: translate('Languge Setting'),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    color: AppColor.background1,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      //contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          TextView(
                            text: translate('Arabic'),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            textAlign: TextAlign.start,
                          ),
                          Switch(value: _value, onChanged: onChanged),
                          TextView(
                            text: translate('English'),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    color: AppColor.background1,
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextView(
                        text: translate('Theme Setting'),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    color: AppColor.background1,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Column(
                        children: [
                          RadioListTile(
                            title: TextView(
                              text: translate('GetThemesFromSystem'),
                              textAlign: TextAlign.start,
                            ),
                            value: 'value1',
                            groupValue: _groupValue,
                            onChanged: onChangedRadio,
                          ),
                          RadioListTile(
                            title: TextView(
                              text: translate('LightThemeMode'),
                              textAlign: TextAlign.start,
                            ),
                            value: 'value2',
                            groupValue: _groupValue,
                            onChanged: onChangedRadio,
                          ),
                          RadioListTile(
                            title: TextView(
                              text: translate('DarkThemeMode'),
                              textAlign: TextAlign.start,
                            ),
                            value: 'value3',
                            groupValue: _groupValue,
                            onChanged: onChangedRadio,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  void onChangedRadio(Object? value) {
    setState(() {
      _groupValue = value as String;
    });
  }
}
