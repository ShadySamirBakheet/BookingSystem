import 'package:flutter/material.dart';
import 'package:booking_system/presentation/widgets/utils/text_from_fielid.dart';
import 'package:booking_system/themes/color.dart';

class PasswordFormField extends StatefulWidget {
  final String title;
  final String? Function(String?) validator;
  final Function(String?) onSaved;
  TextEditingController? controller;

  PasswordFormField(
      {Key? key,
      required this.title,
      required this.validator,
      required this.onSaved,
      this.controller})
      : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  var isPasswordMode = true;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldApp(
      title: widget.title,
      keyType: TextInputType.visiblePassword,
      validator: widget.validator,
      onSaved: widget.onSaved,
      controller: widget.controller,
      isPassword: isPasswordMode,
      suffixIcon: IconButton(
        onPressed: () => setState(() {
          isPasswordMode = !isPasswordMode;
        }),
        icon: Icon(
          isPasswordMode
              ? Icons.visibility_rounded
              : Icons.visibility_off_rounded,
          color: AppColor.txtColor1,
        ),
      ),
    );
  }
}
