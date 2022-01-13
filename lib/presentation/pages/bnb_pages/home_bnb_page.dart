import 'package:booking_system/business_logic/cubit/booking_cubit.dart';
import 'package:booking_system/data/models/booking/booking.dart';
import 'package:booking_system/presentation/pages/book/choose_branch_page.dart';
import 'package:booking_system/presentation/pages/book/report_day_page.dart';
import 'package:booking_system/presentation/widgets/branch/booking_item.dart';
import 'package:booking_system/presentation/widgets/home/splash_loading.dart';
import 'package:booking_system/presentation/widgets/search/search_input_field.dart';
import 'package:booking_system/presentation/widgets/utils/button.dart';
import 'package:booking_system/presentation/widgets/utils/text_view.dart';
import 'package:booking_system/themes/text_style.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:booking_system/utils/constants/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBNBPage extends StatefulWidget {
  const HomeBNBPage({Key? key}) : super(key: key);

  @override
  State<HomeBNBPage> createState() => _HomeBNBPageState();
}

class _HomeBNBPageState extends State<HomeBNBPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BookingCubit>(context).findBookingAll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state is BookingSelectAll) {
          return _viewAll(context, state.bookings);
        } else if (state is BookingInitial) {
          return const Expanded(child: SplahLoading());
        } else {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextView(
                    text: (state as BookingError).error,
                    style: AppStyle().textStyle1,
                  ),
                  const SizedBox(height: 150),
                  ButtonApp(
                    title: translate('BookNow'),
                    action: () {
                      Navigator.of(context)
                          .pushNamed(ChooseBranchPage.routeName);
                    },
                  ),
                  const SizedBox(height: 16),
                  if (user!.getIsAdmin)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonApp(
                        title: translate('ReportToDay'),
                        action: () {
                          Navigator.of(context)
                              .pushNamed(ReportDayPage.routeName);
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Expanded _viewAll(BuildContext context, List<Booking> bookings) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        //mainAxisSize: MainAxisSize.max,
        children: [
          _searchBox(context),
          _users(bookings),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonApp(
              title: translate('BookNow'),
              action: () {
                Navigator.of(context).pushNamed(ChooseBranchPage.routeName);
              },
            ),
          ),
          if (user!.getIsAdmin)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonApp(
                title: translate('ReportToDay'),
                action: () {
                  Navigator.of(context).pushNamed(ReportDayPage.routeName);
                },
              ),
            ),
        ],
      ),
    );
  }

  ListView _users(List<Booking> bookings) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: bookings.length,
      itemBuilder: (context, index) => _itemBuilder(context, bookings[index]),
    );
  }

  Widget _itemBuilder(BuildContext context, Booking booking) {
    return BookingItem(booking: booking);
  }

  _searchBox(BuildContext context) {
    return SearchInputField(
      onChanged: (val) {},
    );
  }
}
