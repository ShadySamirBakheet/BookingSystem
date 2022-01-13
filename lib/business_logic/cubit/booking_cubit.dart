import 'package:bloc/bloc.dart';

import 'package:booking_system/data/models/booking/booking.dart';
import 'package:booking_system/data/models/booking/room_booked.dart';
import 'package:booking_system/data/models/hotel/room.dart';
import 'package:booking_system/data/repository/database_repository.dart';
import 'package:booking_system/utils/constants/utils.dart';
import 'package:booking_system/utils/constants/values.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  DatabaseRepository databaseRepository;
  BookingCubit(
    this.databaseRepository,
  ) : super(BookingInitial());

  findBookingAll() {
    databaseRepository.findBookingAll()!.then((value) {
      print(value);
      if (value != null && value.isNotEmpty) {
        isfirst = false;
        emit(BookingSelectAll(bookings: value));
      } else {
        emit(BookingError(error: translate('NotFound')));
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(BookingError(error: translate('NotFound')));
    });
  }

  void booking(Iterable<Room> list, Booking booking) {
    emit(BookingLoading());
    databaseRepository.insertBooking(booking)!.then((value) {
      if (value != null) {
        for (var item in list) {
          databaseRepository.insertRoomBooked(RoomBooked(
              checkIn: booking.checkIn,
              checkOut: booking.checkOut,
              bookingId: value.id ?? 0,
              roomId: item.id ?? 0));
        }
        emit(BookingAdded());
      } else {
        emit(BookingError(error: 'Error'));
      }
    });
  }
}
