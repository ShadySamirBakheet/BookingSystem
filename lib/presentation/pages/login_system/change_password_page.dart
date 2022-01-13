import 'package:flutter/material.dart';
import 'package:booking_system/presentation/widgets/login_system/password_form_field.dart';
import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';

class ChangePasswordPage extends StatefulWidget {
  static const routeName = '/login/changePassword';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 84),
        child: Form(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/icon.png',
                      width: 35,
                    ),
                    TextView(
                      text: translate('appName'),
                    )
                  ],
                ),
              ),
              TextView(
                text: translate('ChangePassword'),
                textAlign: TextAlign.start,
              ),
              TextView(
                text: translate('appDesc'),
                textAlign: TextAlign.start,
                style: AppStyle().textStyle1.copyWith(fontSize: 18),
              ),
              PasswordFormField(
                title: translate('Enteroldpassword'),
                validator: (val) {},
                onSaved: (val) {},
              ),
              PasswordFormField(
                title: translate('EnterNewpassword'),
                validator: (val) {},
                onSaved: (val) {},
              ),
              PasswordFormField(
                title: translate('EnterConfirmPassword'),
                validator: (val) {},
                onSaved: (val) {},
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonApp(
                title: translate('ChangePassword'),
                action: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
