import 'package:flutter/material.dart';
import 'package:booking_system/themes/color.dart';
import 'package:booking_system/themes/text_style.dart';

import 'package:booking_system/utils/constants/utils.dart';

class SearchInputField extends StatefulWidget {
  const SearchInputField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(String) onChanged;

  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  String? _valSearch;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 4, right: 4, bottom: 8),
      color: AppColor.background1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: AppColor.txtColor1,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SearchFiled(
                title: translate('SearchSubject'),
                onChanged: (val) {
                  widget.onChanged(val);
                  setState(() {
                    if (val.isEmpty) {
                      _valSearch = null;
                    } else {
                      _valSearch = val;
                    }
                  });
                },
                controller: controller,
              ),
            ),
            if (_valSearch != null)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _valSearch = null;
                    controller.clear();
                  });
                },
                child: Icon(
                  Icons.clear,
                  size: 24,
                  color: AppColor.txtColor1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SearchFiled extends StatelessWidget {
  const SearchFiled({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final String title;
  final Function(String) onChanged;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var border = UnderlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        color: AppColor.transparent,
      ),
    );

    var style = AppStyle().textStyle1;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
        disabledBorder: border,
        hintStyle: style,
        hintText: title,
        fillColor: AppColor.background1,
      ),
      style: style,
      keyboardType: TextInputType.name,
      onChanged: onChanged,
    );
  }
}
