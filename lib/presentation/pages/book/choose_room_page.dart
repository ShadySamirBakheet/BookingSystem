import 'package:booking_system/business_logic/cubit/booking_cubit.dart';
import 'package:booking_system/business_logic/cubit/room_cubit.dart';
import 'package:booking_system/data/models/booking/booking.dart';
import 'package:booking_system/data/models/hotel/room.dart';
import 'package:booking_system/presentation/pages/home/home_page.dart';
import 'package:booking_system/presentation/widgets/branch/room_item.dart';
import 'package:booking_system/presentation/widgets/home/app_tool_bar.dart';
import 'package:booking_system/presentation/widgets/home/splash_loading.dart';
import 'package:booking_system/presentation/widgets/search/search_input_field.dart';
import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_from_fielid.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:booking_system/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseRoomPage extends StatefulWidget {
  const ChooseRoomPage({Key? key}) : super(key: key);
  static const routeName = '/branch/room';
  @override
  _ChooseRoomPageState createState() => _ChooseRoomPageState();
}

class _ChooseRoomPageState extends State<ChooseRoomPage> {
  int bid = 0;

  final _formKey = GlobalKey<FormState>();

  int _numPeo = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () {
        bid = ModalRoute.of(context)!.settings.arguments as int;
        BlocProvider.of<RoomCubit>(context).selectAll(bid);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppToolBar(
              showMnue: (context) {},
              title: translate('EditProfile'),
              back: () {
                Navigator.of(context).pop();
              },
            ),
            BlocBuilder<RoomCubit, RoomState>(
              builder: (context, state) {
                if (state is RoomSelectedAll) {
                  return _viewAll(state.rooms);
                } else if (state is RoomInitial) {
                  return const SplahLoading();
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<BookingCubit, BookingState>(
              builder: (context, state) {
                if (state is BookingLoading) {
                  return const SplahLoading();
                } else if (state is BookingAdded) {
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routeName);
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
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Expanded _viewAll(List<Room> rooms) {
    return Expanded(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SearchInputField(
                onChanged: (val) {},
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return RoomItem(
                      room: rooms[index],
                      choosed: rooms[index].choosed,
                      action: (val) {
                        setState(() {
                          rooms[index].choosed = val ?? false;
                        });
                      },
                    );
                  },
                ),
              ),
              TextFormFieldApp(
                title: translate('NumberPeople'),
                keyType: TextInputType.number,
                validator: (val) {
                  return (int.tryParse(val ?? '0') is int)
                      ? null
                      : 'Enter int number';
                },
                onSaved: (val) {
                  _numPeo = int.parse(val!);
                },
              ),
              TextFormFieldApp(
                title: translate('SelectCheckinDate'),
                validator: (p0) {
                  return null;
                },
                onSaved: (p0) {},
                keyType: TextInputType.none,
                value: dateformat.format(startDate),
                suffixIcon: IconButton(
                    onPressed: () => _selectDate(context, startDate, true),
                    icon: const Icon(Icons.date_range)),
              ),
              TextFormFieldApp(
                title: translate('SelectCheckoutDate'),
                validator: (p0) {
                  return null;
                },
                onSaved: (p0) {},
                keyType: TextInputType.none,
                value: dateformat.format(endDate),
                suffixIcon: IconButton(
                    onPressed: () => _selectDate(context, endDate, false),
                    icon: const Icon(Icons.date_range)),
              ),
              ButtonApp(
                title: translate('BookNow'),
                action: () => _bookedNow(rooms),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future<void> _selectDate(
    BuildContext context,
    DateTime date,
    bool start,
  ) async {
    FocusScope.of(context).nextFocus();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      setState(() {
        if (start) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  _bookedNow(List<Room> rooms) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var list = rooms.where((element) => element.choosed == true);

      int price = 0;

      for (var item in list) {
        price += item.priceRoom;
      }
      print('object ' + _numPeo.toString());

      if (!isfirst) {
        price = (price.toDouble() * .95).toInt();
      }

      var booking = Booking(
        peopleNum: _numPeo,
        uid: user!.uid ?? 0,
        checkIn: DateUtils.dateOnly(startDate),
        checkOut: DateUtils.dateOnly(endDate),
        price: price,
      );

      print(booking);

      BlocProvider.of<RoomCubit>(context).remove();
      BlocProvider.of<BookingCubit>(context).booking(list, booking);
    }
  }
}
