import 'package:booking_system/business_logic/cubit/user_cubit.dart';
import 'package:booking_system/data/models/users/user.dart';
import 'package:booking_system/data/models/utils/country.dart';
import 'package:booking_system/presentation/pages/home/home_page.dart';
import 'package:booking_system/presentation/widgets/home/splash_loading.dart';
import 'package:flutter/material.dart';
import 'package:booking_system/presentation/pages/login_system/forgot_password_page.dart';
import 'package:booking_system/presentation/widgets/login_system/dropdown_button.dart';
import 'package:booking_system/presentation/widgets/login_system/google_facebook.dart';
import 'package:booking_system/presentation/widgets/login_system/password_form_field.dart';
import 'package:booking_system/presentation/widgets/utils/pick_image.dart';
import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_from_fielid.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var div = const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      color: Colors.grey,
    ),
  );

  final _formKey = GlobalKey<FormState>();

  late User _user;

  String _name = '';
  String? _image;
  String _phone = '';
  String _email = '';
  String? _address = '';
  String _password = '';
  int _countryId = 1;

  bool _isLoginMode = true;

  final List<Country> _countryPhoneCode = [
    Country(1, '+20: EG', '+20'),
    Country(2, '+380: UA', '+380'),
    Country(3, '+995: GE', '+995'),
    Country(4, '+855: KH', '+855'),
    Country(5, '+853: MO', '+853'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return _loginWidget(context);
          } else if (state is UserLogin) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              },
            );
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/thumbs_up.png',
                    width: 100,
                  ),
                  const SizedBox(height: 32),
                  TextView(
                    text: 'Done',
                    style: AppStyle().textStyle1.copyWith(fontSize: 20),
                  ),
                ],
              ),
            );
          } else if (state is UserLoading) {
            return const SplahLoading();
          } else {
            return Center(
              child: TextView(
                text: 'Done',
                style: AppStyle().textStyle1.copyWith(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _loginWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                      style: AppStyle().textStyle1.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              TextView(
                text: translate('Login'),
                textAlign: TextAlign.start,
                style: AppStyle().textStyle1.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextView(
                text: translate('appDesc'),
                textAlign: TextAlign.start,
                style: AppStyle().textStyle1.copyWith(fontSize: 18),
              ),
              if (!_isLoginMode)
                PickImage(action: (image) {
                  _image = image!.path;
                }),
              if (!_isLoginMode)
                TextFormFieldApp(
                  title: translate('EnterYourname'),
                  keyType: TextInputType.name,
                  validator: (val) {
                    return (val!.isEmpty) ? 'Error Input' : null;
                  },
                  onSaved: (val) {
                    _name = val ?? '';
                  },
                ),
              TextFormFieldApp(
                title: translate('EnterYourEmail'),
                keyType: TextInputType.emailAddress,
                validator: (val) {
                  return (val!.isEmpty) ? 'Error Input' : null;
                },
                onSaved: (val) {
                  _email = val ?? '';
                },
              ),
              if (!_isLoginMode)
                TextFormFieldApp(
                  title: translate('EnterYourphone'),
                  keyType: TextInputType.phone,
                  validator: (val) {
                    return (val!.isEmpty) ? 'Error Input' : null;
                  },
                  onSaved: (val) {
                    _phone = val ?? '';
                  },
                  suffixIcon: DropdownButtonApp(
                    list: _countryPhoneCode,
                    title: _countryPhoneCode[0].name,
                    onChanged: (val) {
                      _countryId = val!.id;
                    },
                  ),
                ),
              if (!_isLoginMode)
                TextFormFieldApp(
                  title: translate('EnterYourAddress'),
                  keyType: TextInputType.phone,
                  validator: (val) {
                    return (val!.isEmpty) ? 'Error Input' : null;
                  },
                  onSaved: (val) {
                    _address = val ?? '';
                  },
                ),
              PasswordFormField(
                title: translate('EnterYourPassword'),
                validator: (val) {
                  return (val!.isEmpty) ? 'Error Input' : null;
                },
                onSaved: (val) {
                  _password = val ?? '';
                },
              ),
              if (!_isLoginMode)
                PasswordFormField(
                  title: translate('EnterConfirmPassword'),
                  validator: (val) {
                    return val != _password ? 'Error Input' : null;
                  },
                  onSaved: (val) {},
                ),
              const SizedBox(
                height: 24,
              ),
              ButtonApp(
                title: translate(_isLoginMode ? 'Login' : 'RegisterNow'),
                action: _loginFun,
              ),
              div,
              const GoogleAndFacebook(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    padding: const EdgeInsets.all(2),
                    text: translate('ForgotPassword'),
                    style: AppStyle().textStyle1.copyWith(fontSize: 18),
                  ),
                  TextView(
                    text: translate('ResetNow'),
                    style: AppStyle()
                        .textStyle1
                        .copyWith(fontSize: 18, color: Colors.red),
                    action: () {
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordPage.routeName);
                    },
                  ),
                ],
              ),
              div,
              TextView(
                text: translate(
                    _isLoginMode ? 'Registernow' : 'Alreadyhavelogin'),
                style: AppStyle()
                    .textStyle1
                    .copyWith(fontSize: 18, color: Colors.red),
                action: () {
                  setState(() {
                    _isLoginMode = !_isLoginMode;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loginFun() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _user = User(
        name: _name,
        phone: _phone,
        email: _email,
        password: _password,
        uImage: _image,
        address: _address,
        country: _countryId,
      );

      BlocProvider.of<UserCubit>(context).authFun(_user, _isLoginMode);
    }
  }
}
