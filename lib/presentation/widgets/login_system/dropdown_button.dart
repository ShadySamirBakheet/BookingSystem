import 'package:booking_system/data/models/utils/country.dart';
import 'package:flutter/material.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';

class DropdownButtonApp extends StatelessWidget {
  DropdownButtonApp({
    Key? key,
    required this.list,
    required this.onChanged,
    this.title,
  }) : super(key: key);

  final List<Country> list;
  String? title;
  final Function(Country?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Country>(
      hint: title != null
          ? TextView(
              text: title!,
              textAlign: TextAlign.end,
              style: AppStyle().textStyle3.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                  ),
            )
          : Container(),
      //value: title,
      dropdownColor: Theme.of(context).primaryColor,
      underline: Container(
        height: 0,
      ),
      iconSize: 32,
      elevation: 4,
      onChanged: onChanged,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).primaryColor,
      ),
      items: [
        ...list.map((item) {
          return DropdownMenuItem<Country>(
            value: item,
            child: Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
            ),
          );
        }).toList()
      ],
    );
  }
}
