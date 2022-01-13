import 'package:booking_system/data/models/booking/booking.dart';
import 'package:booking_system/data/models/hotel/branch.dart';
import 'package:booking_system/presentation/pages/book/choose_room_page.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter/material.dart';

class BookingItem extends StatelessWidget {
  const BookingItem({Key? key, required this.booking}) : super(key: key);
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: ListTile(
        title: TextView(
          text: booking.peopleNum.toString() + ' ' + translate('Peoples'),
          style: AppStyle().textStyle1.copyWith(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: dateformat.format(booking.checkIn),
              style: AppStyle().textStyle4.copyWith(fontSize: 16),
              textAlign: TextAlign.start,
            ),
            TextView(
              text: dateformat.format(booking.checkOut),
              style: AppStyle().textStyle4.copyWith(fontSize: 14),
              textAlign: TextAlign.start,
            ),
            TextView(
              text: '${booking.price} ${translate('EGP')}',
              style: AppStyle().textStyle4.copyWith(fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
