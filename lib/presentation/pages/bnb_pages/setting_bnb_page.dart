import 'dart:io';

import 'package:booking_system/utils/constants/values.dart';
import 'package:flutter/material.dart';

import 'package:booking_system/presentation/pages/login_system/profile_view_edit_page.dart';
import 'package:booking_system/presentation/widgets/utils/lang_manage.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/presentation/widgets/utils/themes_manage.dart';
import 'package:booking_system/themes/color.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';

class SettingsBNBPage extends StatelessWidget {
  const SettingsBNBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                image: DecorationImage(
                  image: (user != null)
                      ? FileImage(File(user!.uImage ?? ''))
                      : const AssetImage('assets/icons/user.png')
                          as ImageProvider,
                ),
              ),
            ),
            TextView(
              text: 'Shady Samir',
              style: AppStyle().textStyle1.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: 16,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Divider(
                    color: AppColor.lineColor,
                  ),
                ),
              ),
            ),
            _listTileMenu(
              title: translate('ThemeApp'),
              iconData: Icons.dark_mode,
              avatarColor: AppColor.black,
              action: () => _showBottomTheme(context),
            ),
            _listTileMenu(
              title: translate('AppLanguage'),
              iconData: Icons.language,
              avatarColor: AppColor.bottomSaved,
              action: () => _showBottomLanguage(context),
            ),
            _titleMenu(translate('Profile')),
            _listTileMenu(
              title: translate('EditProfile'),
              iconData: Icons.manage_accounts,
              avatarColor: AppColor.btnColor1,
              action: () => Navigator.of(context)
                  .pushNamed(ProfileViewEditPage.routeName),
            ),
          ],
        ),
      ),
    );
  }

  TextView _titleMenu(String title) {
    return TextView(
      text: title,
      style: AppStyle().textStyle4.copyWith(fontSize: 18),
      textAlign: TextAlign.start,
    );
  }

  ListTile _listTileMenu({
    Color? avatarColor,
    Color? iconColor,
    required IconData iconData,
    required String title,
    Function()? action,
  }) {
    return ListTile(
      onTap: action,
      leading: CircleAvatar(
        backgroundColor: avatarColor ?? AppColor.black,
        child: Icon(
          iconData,
          color: iconColor ?? AppColor.white,
          size: 20,
        ),
      ),
      title: TextView(
        text: title,
        textAlign: TextAlign.start,
        style: AppStyle()
            .textStyle1
            .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  _showBottomTheme(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) => const ThemesManage());
  }

  _showBottomLanguage(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) => const LanguageManage());
  }
}
