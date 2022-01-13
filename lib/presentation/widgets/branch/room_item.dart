import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter/material.dart';

import 'package:booking_system/data/models/hotel/room.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    Key? key,
    required this.room,
    required this.choosed,
    required this.action,
  }) : super(key: key);
  final Room room;
  final bool choosed;
  final Function(bool?) action;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: CheckboxListTile(
        value: choosed,
        onChanged: action,
        title: TextView(
          text: room.roomName,
          style: AppStyle().textStyle1.copyWith(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: _getRoomType(room.roomType),
              style: AppStyle().textStyle4.copyWith(fontSize: 16),
              textAlign: TextAlign.start,
            ),
            TextView(
              text: '${room.maxCapcity} ${translate('Peoples')}',
              style: AppStyle().textStyle4.copyWith(fontSize: 16),
              textAlign: TextAlign.start,
            ),
            TextView(
              text: room.priceRoom.toString() + ' ' + translate('EGP'),
              style: AppStyle().textStyle4.copyWith(fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }

  _getRoomType(int roomType) {
    return (roomType == 1)
        ? translate('Single')
        : (roomType == 2)
            ? translate('Double')
            : translate('Suite');
  }
}
