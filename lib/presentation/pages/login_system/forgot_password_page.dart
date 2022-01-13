import 'package:flutter/material.dart';

import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_from_fielid.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const routeName = '/login/frogot';
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 84),
        child: Form(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
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
                text: translate('ForgotPassword'),
                textAlign: TextAlign.start,
              ),
              TextView(
                text: translate('appDesc'),
                textAlign: TextAlign.start,
                style: AppStyle().textStyle1.copyWith(fontSize: 18),
              ),
              TextFormFieldApp(
                title: translate('EnterYourEmail'),
                keyType: TextInputType.emailAddress,
                validator: (val) {},
                onSaved: (val) {},
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonApp(
                title: translate('ForgotPassword'),
                action: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
