import 'package:booking_system/data/models/hotel/branch.dart';
import 'package:booking_system/presentation/pages/book/choose_room_page.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:flutter/material.dart';

class BranchItem extends StatelessWidget {
  const BranchItem({Key? key, required this.branch}) : super(key: key);
  final Branch branch;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .pushNamed(ChooseRoomPage.routeName, arguments: branch.id);
        },
        title: TextView(
          text: branch.branchName,
          style: AppStyle().textStyle1.copyWith(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: branch.branchDesc,
              style: AppStyle().textStyle4.copyWith(fontSize: 16),
              textAlign: TextAlign.start,
            ),
            TextView(
              text: branch.branchAddress,
              style: AppStyle().textStyle4.copyWith(fontSize: 14),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
