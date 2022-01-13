import 'package:booking_system/business_logic/cubit/user_cubit.dart';
import 'package:booking_system/data/models/users/user.dart';
import 'package:booking_system/data/models/utils/country.dart';
import 'package:booking_system/presentation/widgets/home/splash_loading.dart';
import 'package:booking_system/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:booking_system/presentation/pages/login_system/change_password_page.dart';
import 'package:booking_system/presentation/widgets/home/app_tool_bar.dart';
import 'package:booking_system/presentation/widgets/login_system/dropdown_button.dart';
import 'package:booking_system/presentation/widgets/utils/pick_image.dart';
import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_from_fielid.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewEditPage extends StatefulWidget {
  const ProfileViewEditPage({Key? key}) : super(key: key);

  static const routeName = '/profile';
  @override
  _ProfileViewEditPageState createState() => _ProfileViewEditPageState();
}

class _ProfileViewEditPageState extends State<ProfileViewEditPage> {
  User? _user;
  bool isEnabled = false;

  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String? _image;
  String _phone = '';
  String _email = '';
  String? _address = '';
  int _countryId = 1;

  List<Country> countryPhoneCode = [
    Country(1, '+20: EG', '+20'),
    Country(2, '+380: UA', '+380'),
    Country(3, '+995: GE', '+995'),
    Country(4, '+855: KH', '+855'),
    Country(5, '+853: MO', '+853'),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserCubit>(context).getUseeFun(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLogin) {
              _user = state.user;
              user = _user;
              return _userInfo(context);
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
      ),
    );
  }

  Column _userInfo(BuildContext context) {
    return Column(
      children: [
        AppToolBar(
          showMnue: (context) {},
          title: translate('EditProfile'),
          back: () {
            Navigator.of(context).pop();
          },
        ),
        Expanded(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                PickImage(
                  action: (image) {
                    _image = image!.path;
                  },
                  isEnabled: isEnabled,
                  imageLink: _user!.uImage,
                ),
                TextFormFieldApp(
                  title: translate('EnterYourname'),
                  keyType: TextInputType.name,
                  validator: (val) {
                    return (val!.isEmpty) ? 'Error Input' : null;
                  },
                  onSaved: (val) {
                    _name = val ?? '';
                  },
                  isEnabled: isEnabled,
                  value: _user!.name ?? '',
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
                  isEnabled: isEnabled,
                  value: _user!.email,
                ),
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
                    list: countryPhoneCode,
                    title: countryPhoneCode[_user!.country].name,
                    onChanged: (val) {
                      setState(() {
                        _countryId = val!.id;
                      });
                    },
                  ),
                  isEnabled: isEnabled,
                  value: _user!.phone ?? '',
                ),
                if (_address != null || isEnabled)
                  TextFormFieldApp(
                      title: translate('EnterYourAddress'),
                      keyType: TextInputType.name,
                      validator: (val) {
                        return (val!.isEmpty) ? 'Error Input' : null;
                      },
                      onSaved: (val) {
                        _address = val;
                      },
                      isEnabled: isEnabled,
                      value: _user!.address ?? ''),
                const SizedBox(height: 32),
                ButtonApp(
                  title: translate(isEnabled ? 'Save' : 'EditProfile'),
                  action: _editUser,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _editUser() {
    if (isEnabled) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        _user!.name = _name;
        _user!.email = _email;
        _user!.phone = _phone;
        _user!.address = _address;
        _user!.uImage = _image;
        _user!.country = _countryId;
      }

      BlocProvider.of<UserCubit>(context).updateUserFun(_user!);
    }
    setState(() {
      isEnabled = !isEnabled;
    });
  }
}
