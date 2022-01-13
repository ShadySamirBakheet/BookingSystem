import 'package:booking_system/business_logic/cubit/room_cubit.dart';
import 'package:booking_system/business_logic/cubit/roombooked_cubit.dart';
import 'package:booking_system/presentation/widgets/branch/room_item.dart';
import 'package:booking_system/presentation/widgets/branch/room_item_view.dart';
import 'package:booking_system/presentation/widgets/home/app_tool_bar.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportDayPage extends StatefulWidget {
  const ReportDayPage({Key? key}) : super(key: key);

  static const routeName = '/report';
  @override
  _ReportDayPageState createState() => _ReportDayPageState();
}

class _ReportDayPageState extends State<ReportDayPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RoomBookedCubit>(context)
        .findRooms(DateUtils.dateOnly(DateTime.now()));
    BlocProvider.of<RoomCubit>(context)
        .findAllRooms(DateUtils.dateOnly(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppToolBar(
              showMnue: (context) {},
              title: translate('ReportToDay'),
              back: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
                child: ListView(
              children: [
                TextView(
                  text: 'Booked',
                  textAlign: TextAlign.start,
                  style: AppStyle().textStyle1.copyWith(fontSize: 18),
                ),
                _getRoomBooked(),
                TextView(
                  text: 'UnBooked',
                  textAlign: TextAlign.start,
                  style: AppStyle().textStyle1.copyWith(fontSize: 18),
                ),
                _getRoom(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  _getRoom() {
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (context, state) {
        if (state is RoomSelectedAll) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.rooms.length,
            itemBuilder: (context, index) {
              return RoomItemView(room: state.rooms[index]);
            },
          );
        }
        return Container();
      },
    );
  }

  _getRoomBooked() {
    return BlocBuilder<RoomBookedCubit, RoomBookedState>(
      builder: (context, state) {
        if (state is RoomSelectAll) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.rooms.length,
            itemBuilder: (context, index) {
              return RoomItemView(room: state.rooms[index]);
            },
          );
        }
        return Container();
      },
    );
  }
}
